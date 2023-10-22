-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.
SELECT * FROM Customers 
WHERE LastName IN('Stevensen','Stephensen','Stevenson','Stephenson','Stuyvesant');

SELECT * FROM Reservations WHERE CustomerID IN(14,91,99) AND PartySize = 4;

-- OR just join the tables

SELECT r.CustomerID,FirstName, LastName, Email,ReservationID,Date, PartySize 
FROM Customers c  
INNER JOIN Reservations r 
ON c.CustomerID = r.CustomerID
WHERE LastName LIKE 'St%'
AND PartySize = 4
ORDER BY Date DESC;