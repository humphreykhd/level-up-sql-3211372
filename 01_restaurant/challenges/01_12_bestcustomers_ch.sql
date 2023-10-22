-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT FirstName, LastName, Email, COUNT(o.OrderID) AS Total_Number_of_Orders
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID
ORDER BY Total_Number_of_Orders DESC
LIMIT 15;