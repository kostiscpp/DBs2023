DELIMITER $$
CREATE TRIGGER `update_total_count` AFTER INSERT ON `checkout` FOR EACH ROW BEGIN
    -- Check if an entry exists for the user in checkout_history
    DECLARE count1 INT;
    SET count1 = (SELECT total_count FROM checkout_history WHERE user_id = NEW.user_id);
    
    -- If no entry exists, insert a new row with a count of 1
    IF count1 IS NULL THEN
        INSERT INTO checkout_history (user_id, total_count)
        VALUES (NEW.user_id, 1);
    
    -- If an entry exists, increment the total borrowings count
    ELSE
        UPDATE checkout_history
        SET total_count = total_count + 1
        WHERE user_id = NEW.user_id;
    END IF;
END
$$
DELIMITER ;