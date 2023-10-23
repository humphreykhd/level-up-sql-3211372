-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

SELECT FirstName, LastName, Email, Duedate, Title,ReturnedDate 
FROM Books b 
INNER JOIN Loans l
ON b.BookID = l.BookID
INNER JOIN Patrons p 
ON l.PatronID = p.PatronID
WHERE Duedate = '2022-07-13' AND ReturnedDate ISNULL
GROUP BY l.BookID;
