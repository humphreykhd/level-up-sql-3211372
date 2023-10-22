-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT * FROM Customers WHERE FirstName = 'Cleo';

UPDATE Customers SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name LIKE 'Quinoa Salmon Salad')
WHERE FirstName = 'Cleo';
