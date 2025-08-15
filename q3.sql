DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    INSERT INTO Subscribers (SubscriberName)
    SELECT subName
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Subscribers  
        WHERE SubscriberName = subName
    );
END$$

DELIMITER ;

CALL AddSubscriberIfNotExists('Sankalp');