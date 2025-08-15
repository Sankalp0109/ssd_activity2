DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subscribersName VARCHAR(100);
    DECLARE listOfAllSubscribers CURSOR FOR
        SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    CREATE TEMPORARY TABLE temp_subscribers (
        Name VARCHAR(100)
    );
    OPEN listOfAllSubscribers;
    read_loop: LOOP
        FETCH listOfAllSubscribers INTO subscribersName;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO temp_subscribers VALUES (subscribersName);
    END LOOP;
    CLOSE listOfAllSubscribers;
    SELECT Name FROM temp_subscribers;
    DROP TEMPORARY TABLE IF EXISTS temp_subscribers;
END$$

DELIMITER ;

CALL ListAllSubscribers();