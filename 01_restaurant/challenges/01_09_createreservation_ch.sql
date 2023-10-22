-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

SELECT CustomerID FROM Customers WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Customers
(FirstName,LastName,Email,Address,City,State,Phone,Birthday)
VALUES('Sam','McAdams','smac@kinetecoinc.com','2929 Cay Roay','Corby','Northans','263978944555','2022-02-19');

INSERT INTO Reservations
(CustomerID, Date, PartySize)
VALUES((SELECT CustomerID FROM Customers WHERE Email = 'smac@kinetecoinc.com'),5);