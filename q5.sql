DROP PROCEDURE IF EXISTS PrintWatchHistoryBySubscriber;

DELIMITER $$

CREATE PROCEDURE PrintWatchHistoryBySubscriber()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE ID INT;

    DECLARE Subscriber CURSOR FOR 
        SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN Subscriber;

    read_loop: LOOP
        FETCH Subscriber INTO ID;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        CALL GetWatchHistoryBySubscriber(ID);
    END LOOP;

    CLOSE Subscriber;
END$$
DELIMITER ;

CALL PrintWatchHistoryBySubscriber();