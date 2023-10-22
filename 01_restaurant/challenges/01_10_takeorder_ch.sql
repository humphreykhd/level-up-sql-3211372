-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT * FROM Customers WHERE LastName = 'Hundey';
SELECT * FROM Orders WHERE CustomerID = 70;
SELECT * FROM Dishes WHERE Name LIKE 'House Salad%';
SELECT * FROM Dishes WHERE Name LIKE 'Mini%';
SELECT * FROM Dishes WHERE Name LIKE 'Tropical%';
INSERT INTO Orders
(CustomerID,OrderDate)
VALUES((SELECT CustomerID FROM Customers WHERE LastName = 'Hundey'),'2022-09-20 14:00:00');

INSERT INTO OrdersDishes
(OrderID, DishID)
VALUES((SELECT OrderID FROM Orders WHERE CustomerID = 70 AND OrderDate = '2022-09-20 14:00:00'),
(SELECT DishID FROM Dishes WHERE Name LIKE 'House Salad')),
((SELECT OrderID FROM Orders WHERE CustomerID = 70 AND OrderDate = '2022-09-20 14:00:00'),
(SELECT DishID FROM Dishes WHERE Name LIKE 'Mini%')),
((SELECT OrderID FROM Orders WHERE CustomerID = 70 AND OrderDate = '2022-09-20 14:00:00'),
(SELECT DishID FROM Dishes WHERE Name LIKE 'Tropical%'));

SELECT * FROM OrdersDishes ORDER BY OrdersDishesID DESC;

SELECT FirstName, LastName,od.OrderID, SUM(Price) AS Total_Price
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
INNER JOIN OrdersDishes od 
ON o.OrderID = od.OrderID
INNER JOIN Dishes d 
ON d.DishID = od.DishID
WHERE c.CustomerID = 70
GROUP BY od.OrderID
ORDER BY OrderDate DESC;