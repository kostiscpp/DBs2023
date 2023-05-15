DELIMITER //

CREATE TRIGGER tr_more_than_two_ch
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN
  DECLARE borrow_count INT;
  SELECT COUNT(*) INTO borrow_count FROM checkout WHERE user_id = NEW.user_id;
  IF borrow_count >= 2 THEN
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
      AND ((SELECT book_id FROM book_copy WHERE NEW.book_copy_id = copy_id) = (SELECT book_id FROM book_copy WHERE c.book_copy_id = copy_id)) 
  ) > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot borrow 2 copies of the same book.';
  END IF;
END //


DELIMITER ;





-- OVERDUE

INSERT INTO checkout (checkout_time, return_time, is_returned,book_copy_id, user_id)
VALUES
('2023-04-11', NULL, 0, 1, 1),
('2023-05-11', NULL, 0, 2, 1);


