
DROP PROCEDURE IF EXISTS SendWatchTimeReport;
DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE ID INT;
    DECLARE ShowCount INT;

    DECLARE Subscriber CURSOR FOR
        SELECT SubscriberID FROM Subscribers ORDER BY SubscriberID;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN Subscriber;

    read_loop: LOOP
        FETCH Subscriber INTO ID;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        
        SELECT COUNT(*) INTO ShowCount
        FROM WatchHistory
        WHERE SubscriberID = ID;

        IF ShowCount > 0 THEN
            CALL ShowsDB.GetWatchHistoryBySubscriber(ID);
        END IF;
    END LOOP;

    CLOSE Subscriber;
END$$
DELIMITER ;

call SendWatchTimeReport();