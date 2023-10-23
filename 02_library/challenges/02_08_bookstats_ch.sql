-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT GROUP_CONCAT(DISTINCT(Title)) AS Title, Published, COUNT(DISTINCT(Title)) AS Publications_per_year
FROM Books
GROUP BY Published
ORDER BY Publications_per_year DESC;

SELECT Title,LoanDate, COUNT(LoanID) AS checked_out_the_most
FROM Books b 
INNER JOIN Loans l 
ON b.BookID = l.BookID
GROUP BY Title
ORDER BY checked_out_the_most DESC
LIMIT 5;