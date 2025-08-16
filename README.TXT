# Lab 2 – SQL Stored Procedures and Cursors  

## Contents of Submission
- q1.sql → Procedure ListAllSubscribers()  
- q2.sql → Procedure GetWatchHistoryBySubscriber(IN sub_id INT)  
- q3.sql → Procedure AddSubscriberIfNotExists(IN subName VARCHAR(100))  
- q4.sql → Procedure SendWatchTimeReport()  
- q5.sql → Procedure PrintWatchHistoryBySubscriber()  

## Steps to Execute

1. Open MySQL Workbench.  
2. Connect to your MySQL server instance.  
3. Select the database where the `Shows`, `Subscribers`, and `WatchHistory` tables are already created.  
4. Execute each `.sql` file (q1.sql … q5.sql) one by one to create the stored procedures.  
5. Test each procedure using `CALL`, for example:  
   - `CALL ListAllSubscribers();`  
   - `CALL GetWatchHistoryBySubscriber(1);`  
   - `CALL AddSubscriberIfNotExists('John Doe');`  
   - `CALL SendWatchTimeReport();`  
   - `CALL PrintWatchHistoryBySubscriber();`  

## Interpretations

### Q1 – ListAllSubscribers()
- Used a **cursor** to iterate through all subscribers.  
- Instead of printing each name one by one immediately, we inserted the names into a **temporary table**.  
- At the end of the procedure, a single `SELECT * FROM temp_subscribers;` query was used to print all results at once.  
- This approach ensures a clean, tabular output of subscriber names, and avoids multiple scattered result sets.  

### Q2 – GetWatchHistoryBySubscriber()
- Takes a subscriber ID as input and returns all shows watched by that subscriber along with watch time.  

### Q3 – AddSubscriberIfNotExists()
- Checks if a subscriber already exists (by name).  
- If not, inserts the new subscriber with the current date.  

### Q4 – SendWatchTimeReport()
- Iterates through all subscribers but only calls `GetWatchHistoryBySubscriber()` if the subscriber has watch history.  
- Avoids unnecessary calls for subscribers with no data.  

### Q5 – PrintWatchHistoryBySubscriber()
- Uses a cursor to loop through all subscribers.  
- Calls `GetWatchHistoryBySubscriber()` for each subscriber to print their watch history.  

## Git Repository
- https://github.com/Sankalp0109/ssd_activity2
