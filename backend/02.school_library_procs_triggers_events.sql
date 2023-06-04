DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `AddBook` (IN `book_ISBN` VARCHAR(20), IN `title` VARCHAR(255), IN `author_name` VARCHAR(255), IN `publisher_name` VARCHAR(255), IN `year_published` INT(4), IN `category_name` VARCHAR(255), IN `keywords` VARCHAR(255), IN `school_id` INT(11), IN `book_copies` INT(11), IN `dewey_code` VARCHAR(8), IN `no_pages` INT(11))   BEGIN
    DECLARE P_ID,C_ID,A_ID,V_COUNT INT DEFAULT 0;
    select count(*) from book where ISBN=book_ISBN INTO V_COUNT;
    
    IF(V_COUNT = 0) THEN
	    select count(*) from publisher where name=publisher_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO publisher (name) VALUES (publisher_name);
			SET P_ID=LAST_INSERT_ID();
	    ELSE
		select publisher_id from publisher where name=publisher_name INTO P_ID;
	    END IF;

	    select count(*) from category where  name=category_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO category (name) VALUES (category_name);
			SET C_ID=LAST_INSERT_ID();
	    ELSE
		select category_id from category where name=category_name INTO C_ID;
	    END IF;

	    select count(*)  from author where  name=author_name INTO V_COUNT;
	    IF (V_COUNT=0) THEN
			INSERT  INTO author (name) VALUES (author_name);
			SET A_ID=LAST_INSERT_ID();
	    ELSE
		select author_id from author where name=author_name INTO A_ID;
	    END IF;
      IF(dewey_code = '800.xx') THEN
	      INSERT INTO book  (ISBN, title, edition, no_pages, publisher_id,year_published, keywords)
	      VALUES(book_ISBN, title, year_published, no_pages, P_ID,year_published, keywords);
      ELSE
        INSERT INTO book  (ISBN, title, edition, no_pages, publisher_id, dewey_code, year_published, keywords)
	      VALUES(book_ISBN, title, year_published, no_pages, P_ID, dewey_code ,year_published, keywords);
      END IF;

	    INSERT INTO book_to_author (ISBN,author_id) 
	    VALUES(book_ISBN, A_ID);

	    INSERT INTO book_to_category (ISBN, category_id) 
	    VALUES(book_ISBN, C_ID);

	    INSERT INTO book_copy (book_id, school_id, book_copies_number, available_copies_number)
	    VALUES(book_ISBN, school_id, book_copies, book_copies);
    ELSE
      select count(*) INTO V_COUNT from book_copy b where b.school_id = school_id and b.book_id = book_ISBN;
      IF (V_COUNT = 0) THEN
        INSERT INTO book_copy (book_id, school_id, book_copies_number, available_copies_number)
	      VALUES(book_ISBN, school_id, book_copies, book_copies);
      ELSE
        UPDATE book_copy b SET b.book_copies_number = b.book_copies_number + book_copies, b.available_copies_number = b.available_copies_number + book_copies
        WHERE b.book_id = book_ISBN AND b.school_id = school_id;
      END IF;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Author2Book`(IN `book_ISBN` VARCHAR(255), IN `author_name` VARCHAR(255))
BEGIN

    DECLARE A_ID,V_COUNT INT DEFAULT 0;
    
    select count(*) INTO V_COUNT from book where ISBN=book_ISBN;
    -- If book exists
    IF(V_COUNT = 1) THEN
            select count(*)  INTO V_COUNT from author where  name=author_name;
	    IF (V_COUNT=0) THEN
			INSERT  INTO author (name) VALUES (author_name);
			SET A_ID=LAST_INSERT_ID();
	    ELSE
		select author_id INTO A_ID from author where name=author_name;
	    END IF;
	    INSERT INTO book_to_author (ISBN, author_id) 
	    VALUES(book_ISBN, A_ID);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Category2Book`(IN `book_ISBN` VARCHAR(20), IN `category_name` VARCHAR(255))
BEGIN
-- Procedure Add_Category2Book
--   Add Category to existing Book
--   call Add_Category2Book(book_ISBN,author_name);
    
    DECLARE C_ID,V_COUNT INT DEFAULT 0;
    select count(*)  INTO V_COUNT from book where ISBN=book_ISBN;
    -- If book exists
    IF(V_COUNT = 1) THEN
            select count(*)  INTO V_COUNT from category where  name=category_name;
	    IF (V_COUNT=0) THEN
			INSERT  INTO category (name) VALUES (category_name);
			SET C_ID=LAST_INSERT_ID();
	    ELSE
		select category_id  INTO C_ID from category where name=category_name;
	    END IF;
	    INSERT INTO book_to_category (ISBN, category_id) 
	    VALUES(book_ISBN, C_ID);
    END IF;
END$$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `DemandBook` (IN `book_copy_id` INT(11), IN `user_id` INT(11))
  BEGIN
    -- Update current holds/checkouts
    UPDATE checkout c SET c.checkout_status = 'overdue' WHERE c.checkout_status = 'active' AND c.user_id = user_id AND DATEDIFF(CURDATE(),c.checkout_time) > 7;
    UPDATE hold h SET h.hold_status = 'cancelled' WHERE h.hold_status = 'active' AND h.user_id = user_id AND DATEDIFF(CURDATE(),h.expiration_time) < 0;
    --
    INSERT INTO hold (book_copy_id, user_id) VALUES (book_copy_id, user_id);
    IF (SELECT available_copies_number FROM book_copy WHERE copy_id = book_copy_id) > 0
    THEN 
      UPDATE hold h SET h.hold_status = 'pending' WHERE h.book_copy_id = book_copy_id AND h.user_id = user_id;
      UPDATE book_copy b SET b.available_copies_number = b.available_copies_number - 1  WHERE b.copy_id = book_copy_id; 
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckoutBook` (IN `book_copy_id` INT(11), IN `user_id` INT(11))
  BEGIN
    UPDATE hold h SET h.hold_status = 'completed' WHERE h.book_copy_id = book_copy_id AND h.user_id = user_id;
    UPDATE book_copy SET available_copies_number = available_copies_number + 1 WHERE copy_id = book_copy_id  ;
    INSERT INTO checkout (book_copy_id, user_id) VALUES (book_copy_id, user_id);
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReturnBook` (IN `book_copy_id` INT(11), IN `user_id` INT(11))
  BEGIN
    IF(DATEDIFF(CURDATE(), (SELECT checkout_time FROM checkout c WHERE c.book_copy_id = book_copy_id AND c.user_id = user_id)) > 7) THEN
      UPDATE checkout c SET  c.checkout_status = 'overdue-returned', return_time = current_timestamp() WHERE c.book_copy_id = book_copy_id AND c.user_id = user_id;
    ELSE
      UPDATE checkout c SET  c.checkout_status = 'returned' , return_time = current_timestamp() WHERE c.book_copy_id = book_copy_id AND c.user_id = user_id;
    END IF;
  END$$


DELIMITER ;


DELIMITER $
CREATE DEFINER=`root`@`localhost` FUNCTION `ISBN13to10`(isbn13 VARCHAR(50)) RETURNS varchar(50) CHARSET utf8 COLLATE utf8_general_ci
BEGIN
    DECLARE isbn10 	VARCHAR(13);
    DECLARE i   	VARCHAR(13);
    DECLARE sum 	INT;
    DECLARE chk 	INT;
    DECLARE chkchar 	VARCHAR(3);

    IF (LENGTH(isbn13) = 10) THEN
        RETURN isbn13;
    ELSEIF (LENGTH(isbn13) != 13 || SUBSTRING(isbn13, 1, 3) != '978') THEN
        RETURN isbn13;
    END IF;

    SET i = SUBSTRING(isbn13, 4, 10);

    IF (LENGTH(i) < 10) THEN
	SET i = LPAD(i, 10 , '0');
    END IF;
	
    SET sum = 
        1 * LEFT(i ,1) 
        + 2 * RIGHT(LEFT(i ,2),1)
        + 3 * RIGHT(LEFT(i ,3),1)
        + 4 * RIGHT(LEFT(i ,4),1)
        + 5 * RIGHT(LEFT(i ,5),1)
        + 6 * RIGHT(LEFT(i ,6),1)
        + 7 * RIGHT(LEFT(i ,7),1) 
        + 8 * RIGHT(LEFT(i ,8),1) 
        + 9 * RIGHT(LEFT(i ,9),1);   

	SET chkchar = 'X';	
    SET chk = sum % 11;
    
    IF (chk = 10) THEN
        SET chk = 90980;        
    END IF;
	
	IF (chk != 90980) THEN
		SET chkchar = CAST(chk as CHAR);
	END IF;
	
    RETURN CONCAT(SUBSTRING(isbn13, 4, 9), chkchar);
END$

DELIMITER ;


DELIMITER //

CREATE TRIGGER tr_more_than_two_ch
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN
  DECLARE CH_COUNT INT(11) DEFAULT 0;
  SELECT COUNT(*) INTO CH_COUNT FROM checkout WHERE user_id = NEW.user_id AND (checkout_status = 'active' OR checkout_status = 'overdue');
  IF CH_COUNT = 1 AND (SELECT `role` FROM user WHERE user_id = NEW.user_id) = 'teacher' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow more than 1 book.';
  END IF;
  IF CH_COUNT >= 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow more than 2 books.';
  END IF;
END //

CREATE TRIGGER tr_check_overdue_ch
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM checkout
    WHERE user_id = NEW.user_id
      AND return_time IS NULL
      AND DATEDIFF(CURDATE(), checkout_time) > 7
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow books, you have an overdue book checkout.';
  END IF;
END //

CREATE TRIGGER tr_same_book_ch
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM checkout c
    WHERE c.user_id = NEW.user_id
      AND c.return_time IS NULL
      AND (c.book_copy_id = NEW.book_copy_id) 
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow 2 copies of the same book.';
  END IF;
END //

CREATE TRIGGER tr_more_than_two_h
BEFORE INSERT ON hold
FOR EACH ROW
BEGIN
  DECLARE hold_count INT;
  SELECT COUNT(*) INTO hold_count FROM hold WHERE (user_id = NEW.user_id AND (hold_status = 'active' OR hold_status = 'pending'));
  IF hold_count = 1 AND (SELECT `role` FROM user WHERE user_id = NEW.user_id) = 'teacher' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot reserve more than 1 book.';
  END IF;
  IF hold_count >= 2 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot reserve more than 2 books.';
  END IF;
END //

CREATE TRIGGER tr_check_overdue_h
BEFORE INSERT ON hold
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM checkout
    WHERE user_id = NEW.user_id
      AND return_time IS NULL
      AND DATEDIFF(CURDATE(), checkout_time) > 7
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow books, you have an overdue book checkout.';
  END IF;
END //

CREATE TRIGGER tr_same_book_h
BEFORE INSERT ON hold
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM hold h
    WHERE h.user_id = NEW.user_id
      AND (h.hold_status = 'active' OR h.hold_status = 'pending')
      AND (h.book_copy_id = NEW.book_copy_id) 
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot hold 2 copies of the same book.';
  END IF;
END //

CREATE TRIGGER tr_same_book_h_c
BEFORE INSERT ON hold
FOR EACH ROW
BEGIN

  IF (
    SELECT COUNT(*) FROM checkout c
    WHERE c.user_id = NEW.user_id
      AND c.return_time IS NULL
      AND (c.book_copy_id = NEW.book_copy_id)
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot hold a book you have already borrowed.';
  END IF;
END //

 CREATE TRIGGER tr_decr_availability_ch
 AFTER INSERT ON checkout
 FOR EACH ROW
 BEGIN
    IF NEW.checkout_status = 'active' OR NEW.checkout_status = 'overdue' 
    THEN
     UPDATE book_copy
     SET available_copies_number = available_copies_number - 1
     WHERE copy_id = NEW.book_copy_id;
    END IF;
 END //
 
CREATE TRIGGER tr_incr_availability_ch
AFTER UPDATE ON checkout
FOR EACH ROW
BEGIN
    IF NEW.checkout_status = 'returned' OR NEW.checkout_status = 'overdue-returned'
    THEN
        UPDATE book_copy
        SET available_copies_number = available_copies_number + 1
        WHERE copy_id = NEW.book_copy_id;
    END IF;

END //

CREATE TRIGGER tr_incr_availability_rej
AFTER UPDATE ON hold
FOR EACH ROW
BEGIN
    IF NEW.hold_status = 'rejected' AND old.hold_status = 'pending'
    THEN
        UPDATE book_copy
        SET available_copies_number = available_copies_number - 1
        WHERE copy_id = NEW.book_copy_id;
    END IF;

END //


CREATE TRIGGER tr_find_older_h
AFTER UPDATE ON book_copy
FOR EACH ROW
BEGIN
    DECLARE U_ID INT(11) DEFAULT 0;
    IF (NEW.available_copies_number > 0) AND ((SELECT COUNT(*) FROM hold WHERE book_copy_id = NEW.copy_id AND hold_status = 'active' AND expiration_time > current_timestamp() LIMIT 1) > 0 )
    THEN
        SELECT user_id INTO U_ID FROM hold WHERE book_copy_id = NEW.copy_id AND hold_status = 'active'
        ORDER BY hold_time ASC 
        LIMIT 1;
        UPDATE hold SET hold_status = 'pending' WHERE user_id = U_ID AND NEW.copy_id = book_copy_id;  
    END IF;

END //

CREATE TRIGGER review_on_same_book
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
  IF (SELECT count(*) FROM review r 
        WHERE r.user_id = NEW.user_id 
        AND r.book_id = NEW.book_id
      ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot review a book two times.';
    END IF;
END//

CREATE TRIGGER update_average_rating_insert
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    UPDATE book b
    SET b.average_rating = (
        SELECT COALESCE(AVG(rating), 0)
        FROM review
        WHERE book_id = NEW.book_id AND review_status = 'accepted'
    )
    WHERE b.ISBN = NEW.book_id;
END //

CREATE TRIGGER update_average_rating_update
AFTER UPDATE ON review
FOR EACH ROW
BEGIN
    UPDATE book b
    SET average_rating = (
        SELECT COALESCE(AVG(rating), 0)
        FROM review
        WHERE book_id = NEW.book_id AND review_status = 'accepted'
    )
    WHERE b.ISBN = NEW.book_id;
END //


DELIMITER ;


CREATE EVENT update_all_h
    ON SCHEDULE
      EVERY 1 HOUR
    DO
      UPDATE hold SET hold_status = 'cancelled' WHERE hold_status = 'active' AND DATEDIFF(CURDATE(),expiration_time) > 0;
CREATE EVENT update_all_ch
    ON SCHEDULE
      EVERY 1 HOUR
    DO      
      UPDATE checkout SET checkout_status = 'overdue' WHERE checkout_status = 'active' AND DATEDIFF(CURDATE(),checkout_time) > 7;

COMMIT;