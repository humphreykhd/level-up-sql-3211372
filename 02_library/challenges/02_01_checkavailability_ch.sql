-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT(
(SELECT COUNT(*) FROM Books WHERE Title = 'Dracula') - (SELECT COUNT(*) FROM Loans l 
INNER JOIN Books b 
ON l.BookID = b.BookID
WHERE Title = 'Dracula'
AND ReturnedDate ISNULL))
AS Available_Copies;
