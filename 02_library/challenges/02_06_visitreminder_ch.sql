-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT FirstName, LastName, Email, COUNT(l.PatronID)AS Books_Borrowed FROM Patrons p
INNER JOIN Loans l
ON p.PatronID = l.PatronID
GROUP BY l.PatronID
ORDER BY Books_Borrowed ASC
LIMIT 15;
