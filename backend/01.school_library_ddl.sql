DROP DATABASE IF EXISTS db1initial;

CREATE DATABASE db1initial;

USE db1initial;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2023 at 09:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET GLOBAL event_scheduler="ON";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db1`
--

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
            select count(*)  INTO V_COUNT from author where  name=author_id;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `db1initial`.`ISBN13to10`(isbn13 VARCHAR(50)) RETURNS varchar(50) CHARSET utf8 COLLATE utf8_general_ci
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


-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` varchar(30) NULL,
  `phone_number` bigint(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `principal_name` varchar(60) NOT NULL,
  `operator_name` varchar(60) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

ALTER TABLE `school` AUTO_INCREMENT = 0;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
-- --------------------------------------------------------

--
-- Table structure for table `book`
-- 

CREATE TABLE `book` (

  `ISBN` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `edition` varchar(50) NOT NULL DEFAULT 'X.0',
  `dewey_code` varchar(8) NOT NULL DEFAULT  CONCAT(LPAD(FLOOR(RAND() * 999) , 3, '0'), '.', FLOOR(RAND() * 99)) COMMENT 'https://en.wikipedia.org/wiki/List_of_Dewey_Decimal_classes ',
  `no_pages` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `summary` longtext NOT NULL DEFAULT 'Summary of the Book',
  `image` varchar(255) NOT NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeE4BZwuwU8ODTBIrNIoSs4xxVuOU2XSzQTQ&usqp=CAU',
  `language` varchar(40) NOT NULL DEFAULT 'English',
  `keywords` varchar(255) NOT NULL DEFAULT 'Key words of the book',
  `year_published` INT(4) NOT NULL,
  `average_rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (ISBN),
  CONSTRAINT `FK_PUBLISHER_ID` FOREIGN KEY (publisher_id) REFERENCES `publisher` (publisher_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------
--
-- Table structure for table `book_copy`
--

-- --------------------------------------------------------

CREATE TABLE `book_copy` (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(20) NOT NULL,
  `school_id` int(11) NOT NULL,
  `book_copies_number` int(11) NOT NULL DEFAULT 0,
  `available_copies_number` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`copy_id`),
  CONSTRAINT `FK_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SCHOOL_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_copies` CHECK (book_copies_number >= 0 AND available_copies_number >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_to_author`
--

-- --------------------------------------------------------

CREATE TABLE `book_to_author` (
  `author_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY (`author_id`,`ISBN`),
  CONSTRAINT `FK_AUTHOR_ID` FOREIGN KEY (author_id) REFERENCES `author` (author_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_AUTH_ISBN` FOREIGN KEY (ISBN) REFERENCES `book` (ISBN) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- Table structure for table `book_to_category`
--

-- --------------------------------------------------------

CREATE TABLE `book_to_category` (
  `category_id` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  PRIMARY (`category_id`,`ISBN`),
  CONSTRAINT `FK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_ISBN` FOREIGN KEY (ISBN) REFERENCES `book` (ISBN) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL UNIQUE,
  `pwd` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `status` enum('active','inactive','deleted', 'pending', 'rejected') NOT NULL DEFAULT 'pending',
  `role` enum('admin','operator','teacher','student') NOT NULL,
  `profile` varchar(255) NOT NULL DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/300px-User-avatar.svg.png',
  `barcode` varchar(20) DEFAULT NULL UNIQUE,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_SCH_ID` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL AUTO_INCREMENT,
  `checkout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `return_time` datetime,
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkout_status` enum('active','returned','overdue','overdue-returned') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`checkout_id`),
  CONSTRAINT `FK_C_COPY_ID` FOREIGN KEY (book_copy_id) REFERENCES `book_copy` (copy_id),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (user_id) REFERENCES `user` (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hold`
--

CREATE TABLE `hold` (
  `hold_id` int(11) NOT NULL AUTO_INCREMENT,
  `hold_time` datetime NOT NULL DEFAULT current_timestamp(),
  `expiration_time` datetime NOT NULL DEFAULT DATE_ADD(current_timestamp(), INTERVAL 1 WEEK),
  `book_copy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hold_status` enum('completed','active', 'cancelled', 'pending') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`hold_id`),
  CONSTRAINT `FK_H_COPY_ID` FOREIGN KEY (`book_copy_id`) REFERENCES `book_copy` (`copy_id`),
  CONSTRAINT `FK_UID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


-- --------------------------------------------------------

--
-- Table structure for table `review`
--

-- --------------------------------------------------------

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` int(5) NOT NULL,
  `book_id` varchar(50) NOT NULL,
  `review_status` enum('rejected','pending','accepted') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`review_id`),
  CONSTRAINT `FK_R_ISBN` FOREIGN KEY (`book_id`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `FK_R_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;


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
     UPDATE book_copy
     SET available_copies_number = available_copies_number - 1
     WHERE copy_id = NEW.book_copy_id;
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

-- !!!!!!!!!!!!!!!!!! FOR FRONTEND !!!!!!!!!!!!!!!!!!!!!!
-- CREATE TRIGGER tr_request
-- AFTER INSERT ON hold
-- FOR EACH ROW
-- BEGIN
--     IF (SELECT available_copies_number FROM book_copy WHERE copy_id = NEW.book_copy_id) > 0
--     THEN 
--         UPDATE hold SET hold_status = 'pending' WHERE book_copy_id = NEW.book_copy_id AND user_id = NEW.user_id;
--     END IF;

-- END //

-- !!!!!!!!!!!!!!!!!!!!!!!!!!! ALSO !!!!!!!!!!!!!!!!!!!!!!!!!!
-- When updating for book return, set date = current_timestamp()

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

CREATE TRIGGER update_average_rating_insert
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    UPDATE book b
    SET average_rating = (
        SELECT AVG(rating)
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
        SELECT AVG(rating)
        FROM review
        WHERE book_id = NEW.book_id AND review_status = 'accepted'
    )
    WHERE b.ISBN = NEW.book_id;
END //
-- CREATE TRIGGER tr_lock_availability_for_pending
-- BEFORE UPDATE ON hold
-- FOR EACH ROW
-- BEGIN
--     IF (NEW.hold_status = 'pending' AND OLD.hold_status = 'active' AND (SELECT available_copies_number FROM book_copy WHERE copy_id = NEW.book_copy_id) > 0) 
--     THEN
--       UPDATE book_copy SET available_copies_number = available_copies_number - 1 WHERE copy_id = NEW.book_copy_id;
--     END IF;
-- END //
-- 
DELIMITER ;

-- SELECT * FROM `V_book_school_inventory` WHERE B_ID = '9780006512134' and S_ID=2;

-- CREATE OR REPLACE VIEW view_school AS
-- SELECT * 
-- FROM book b
-- JOIN book_copy bc ON b.ISBN = bc.book_id
-- GROUP BY bc.school_id
-- ORDER BY bc.school_id;

CREATE OR REPLACE VIEW view_school AS
SELECT b.*, bc.*
FROM book b
JOIN book_copy bc ON b.ISBN = bc.book_id;

CREATE OR REPLACE VIEW view_school_users AS
SELECT u.* FROM user u WHERE u.role = 'student' OR u.role = 'teacher';

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
