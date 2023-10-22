-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.
SELECT r.CustomerID,FirstName, LastName, ReservationID, Date, PartySize 
FROM Customers c 
INNER JOIN Reservations r 
ON c.CustomerID = r.CustomerID
WHERE FirstName = 'Norby';

SELECT * FROM Reservations WHERE CustomerID = 64;

DELETE FROM Reservations WHERE ReservationID = 2000;