-- Database Queries

-- Find all customers with postal code 1010
/* 
    *   SELECT * FROM Customers where PostalCode = 1010
    *   CustomerIDs and Names
        12) Cactus Comidas para llevar
        54) Océano Atlántico Ltda.
        64) Rancho grande
*/

-- Find the phone number for the supplier with the id 11
/* 
    *   SELECT * FROM Suppliers where SupplierID = 11
    *   Phone number = (010) 9984510
*/

-- List first 10 orders placed, sorted descending by the order date
/* 
    *   SELECT * FROM Orders order by OrderDate desc LIMIT 10
    *   OrderIDs and OrderDates in order presented
        10443) 1997-02-12
        10442) 1997-02-11
        10440) 1997-02-10
        10441) 1997-02-10
        10439) 1997-02-07
        10438) 1997-02-06
        10436) 1997-02-05
        10437) 1997-02-05
        10435) 1997-02-04
        10433) 1997-02-03
*/

-- Find all customers that live in London, Madrid, or Brazil
/*
    *   SELECT * FROM Customers where City = "London" or City = "Madrid" or Country = "Brazil"
    *   CustomerID, Name, City/Country
        4)  Around the Horn - London
        8)	Bólido Comidas preparadas - Madrid
        11)	B's Beverages - London
        15)	Comércio Mineiro - Brazil
        16)	Consolidated Holdings - London
        19)	Eastern Connection - London
        21)	Familia Arquibaldo - Brazil
        22)	FISSA Fabrica Inter. Salchichas S.A. - Madrid
        31)	Gourmet Lanchonetes	André Fonseca - Brazil
        34)	Hanari Carnes - Brazil
        53)	North/South	Simon Crowther - London
        61)	Que Delícia	Bernardo Batista - Brazil
        62)	Queen Cozinha - Brazil
        67)	Ricardo Adocicados - Brazil
        69)	Romero y tomillo - Madrid
        72)	Seven Seas Imports - London
        81)	Tradição Hipermercados - Brazil
        88)	Wellington Importadora - Brazil
*/

-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"
/*
    *   INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) values ("The Shire", "Bilbo Baggins", "1 Hobbit-Hole", "Bag End", "111", "Middle Earth")
    *   Return: You have made changes to the database. Rows affected: 1
    *   { 92, The Shire, Bilbo Baggins, 1 Hobbit-Hole, Bag End, 111, Middle Earth }
*/

-- Update Bilbo Baggins record so that the postal code changes to "11122"
/*
    *   UPDATE Customers 
        SET PostalCode = "11122" 
        WHERE ContactName = "Bilbo Baggins"
    *   Return Statement: You have made changes to the database. Rows affected: 1
    *   {92, The Shire, Bilbo Baggins, 1 Hobbit-Hole, Bag End, 11122, Middle Earth }

*/

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted
/*
    *   SELECT DISTINCT City FROM Customers
    *   Number: 70 w/ "Bag End", 69 w/o "Bag End"
*/

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name
/*
    *   SELECT * FROM Suppliers WHERE length(SupplierName) > 20 
    *   SupplierID) Supplier Name
        2)  New Orleans Cajun Delights
        3)	Grandma Kelly's Homestead
        5)	Cooperativa de Quesos 'Las Cabras'
        8)	Specialty Biscuits, Ltd.
        10)	Refrescos Americanas LTDA
        11)	Heli Süßwaren GmbH & Co. KG
        12)	Plutzer Lebensmittelgroßmärkte AG
        13)	Nord-Ost-Fisch Handelsgesellschaft mbH
        14)	Formaggi Fortini s.r.l.
        18)	Aux joyeux ecclésiastiques
        19)	New England Seafood Cannery
*/
