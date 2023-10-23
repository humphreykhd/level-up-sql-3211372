-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT Loans.BookID, Title, Published, ReturnedDate, COUNT(Loans.BookID) AS Total_Number_of_Books 
FROM Books
INNER JOIN Loans
ON Books.BookID = Loans.BookID
WHERE ReturnedDate IS NOT NULL AND Published BETWEEN 1890 AND 1899
GROUP BY Loans.BookID
ORDER BY Published ASC;

SELECT BookID, Title, Barcode FROM Books 
WHERE Published BETWEEN 1890 AND 1899
AND (BookID NOT IN (SELECT BookID FROM Loans WHERE ReturnedDate IS NULL))
ORDER BY Published ASC ;