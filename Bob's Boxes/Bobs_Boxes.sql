/*CREATE DATABASE FinalProject


CREATE TABLE Zipcode (
	Zipcode int PRIMARY KEY NOT NULL,
	City char(30) NOT NULL,
	State char(2) NOT NULL,
	)

CREATE TABLE Shippers (
	ShipperID int PRIMARY KEY NOT NULL,
	Name char(30) NOT NULL,
	);
	

CREATE TABLE Store (
	StoreID int PRIMARY KEY NOT NULL,
	Name char(20) NOT NULL,
	Zipcode int  NOT NULL,
	Address varchar(50) NOT NULL,
	Phone int NOT NULL,
	CONSTRAINT FK_Zip FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)
	);

CREATE TABLE Customers (
	CustomerID int PRIMARY KEY NOT NULL,
	CustomerFirst char(30) NOT NULL,
	CustomerLast char(30) NOT NULL,
	Address nvarchar(50) NOT NULL,
	Zipcode int NOT NULL,
	CONSTRAINT FK_CustomerZip FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)
	)

CREATE TABLE Employees (
	EmployeeID int PRIMARY KEY NOT NULL,
	StoreID int NOT NULL,
CONSTRAINT FK_EmpStoreID FOREIGN KEY(StoreID) REFERENCES Store(StoreID),
	EmployeeFirst char(30) NOT NULL,
	EmployeeLast char(30) NOT NULL,
	EmployeeAddress varchar(50) NOT NULL,
	Zipcode int NOT NULL,
CONSTRAINT FK_EmpZipcode FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode),
	EmployeePhone int NOT NULL,
	HireDate date NULL,
	Position varchar(20) NULL,
	);

CREATE TABLE Orders (
	OrderNumber int PRIMARY KEY NOT NULL,
	CustomerID int NOT NULL,
	CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	QuantitySold int NOT NULL,
	DateSold date NULL,
	ShipperID int NOT NULL,
	CONSTRAINT FK_ShipperID FOREIGN KEY(ShipperID) REFERENCES Shippers(ShipperID),
	EmployeeID int NOT NULL,
	CONSTRAINT FK_EmployeeID FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
	StoreID int NOT NULL,
	CONSTRAINT FK_StoreID FOREIGN KEY(StoreID) REFERENCES Store(StoreID),
	)

	CREATE TABLE OrderDetails (
	OrderNumber int NOT NULL,
CONSTRAINT FK_OrderNumber FOREIGN KEY(OrderNumber) REFERENCES Orders(OrderNumber),
	ItemNumber int PRIMARY KEY NOT NULL,
	Price money NOT NULL,
	ItemDesc char(120) NULL,
	);
	
	USE FinalProject
	ALTER TABLE STORE
	ALTER COLUMN Phone varchar(20);

	USE FinalProject

	INSERT INTO Zipcode VALUES ('49686', 'Traverse City', 'MI')
	INSERT INTO Zipcode VALUES ('23450', 'Virginia Beach', 'VA')
	INSERT INTO Zipcode VALUES ('08201', 'Egg Harbor', 'NJ')
	INSERT INTO Zipcode VALUES ('77001', 'Houstan', 'TX')
	INSERT INTO Zipcode VALUES ('90001', 'Los Angeles', 'CA')
	INSERT INTO Zipcode VALUES ('95743', 'Pheonix', 'AZ')
	INSERT INTO Zipcode VALUES ('34689', 'Honolulu', 'HI')
	INSERT INTO Zipcode VALUES ('13479', 'Nashville-Davidson', 'TN')
	INSERT INTO Zipcode VALUES ('34983', 'St. Louis', 'MO')
	INSERT INTO Zipcode VALUES ('12389', 'Detroit', 'MI')
	INSERT INTO Zipcode VALUES ('13498', 'Huntington', 'NY')
	INSERT INTO Zipcode VALUES ('95648', 'Long Beach', 'CA')
	INSERT INTO Zipcode VALUES ('56869', 'Henderson', 'NV')
	INSERT INTO Zipcode VALUES ('49822', 'Austin', 'TX')
	INSERT INTO Zipcode VALUES ('53453', 'Oakland', 'CA')
	INSERT INTO Zipcode VALUES ('12357', 'Bakersfield', 'CA')
	INSERT INTO Zipcode VALUES ('73345', 'Cincinnati', 'OH')
	INSERT INTO Zipcode VALUES ('62234', 'Buffalo', 'NY')

	INSERT INTO Customers VALUES ('49128', 'John', 'Cheat', '123 Peddle Lane', '49822')
	INSERT INTO Customers VALUES ('12384', 'Mary', 'Tree', '293 Oak Avenue', '53453')
	INSERT INTO Customers VALUES ('59382', 'Paul', 'McCarthur', '209 Academy Road', '12357')
	INSERT INTO Customers VALUES ('24859', 'Jim', 'Dairy', '920 Milk Bl', '73345')
	INSERT INTO Customers VALUES ('12398', 'Clark', 'Leaf', '2930 Maple Lane', '62234')

	INSERT INTO Store VALUES ('1', 'Bobs Boxes', '49686', '192 Front Street', '231-238-4829')
	INSERT INTO Store VALUES ('2', 'Bobs Boxes', '23450', '2094 Paradise Avenue', '757-395-1348')
	INSERT INTO Store VALUES ('3', 'Bobs Boxes', '08201', '294 Peanut Lane', '732-482-4920')
	INSERT INTO Store VALUES ('4',' Bobs Boxes', '77001', '2900 Sand Road', '214-393-3292')
	INSERT INTO Store VALUES ('5', 'Bobs Boxes', '90001', '9548 Peddlebrooke Lane', '805-139-1843')

	INSERT INTO Shippers VALUES ('1', 'Phils Shipments')
	INSERT INTO Shippers VALUES ('2', 'Tonys Delivery')
	INSERT INTO Shippers VALUES ('3', 'Shipments R Us')
	INSERT INTO Shippers VALUES ('4', 'Fast Shipments')
	INSERT INTO Shippers VALUES ('5', 'Chip Ships')

	ALTER TABLE Employees
	ALTER COLUMN EmployeePhone varchar(20);

	
	INSERT INTO Employees VALUES (95743, 1, 'Allen', 'Sandoval', '1858 Twin Oaks Drive', 13498, '392-382-2384', '6/20/1990', 'Sales Person')
	INSERT INTO Employees VALUES (34689, 1,	'Theokritos', 'Norman', '2406 Kenwood Place', 12357, '230-238-2329', '2/15/1985', 'Sales Person')
	INSERT INTO Employees VALUES (13479, 2, 'Phebe', 'Le', '2080 Kildeer Drive', 12389, '123-238-2399', '4/10/1987', 'Manager')
	INSERT INTO Employees VALUES (34983, 2, 'Hanna', 'Vargas', '4532 Jefferson Street', 13498, '219-239-1238', '10/12/1984', 'Sales Person')
	INSERT INTO Employees VALUES (12389, 3, 'Markos', 'Byrne', '4541 West Side Avenue', 23450, '958-239-1953', '11/20/1980', 'Manager')
	INSERT INTO Employees VALUES (13498, 3, 'Oihana', 'Hicks', '1052 Austin Avenue', 34689, '783-064-0280', '3/14/1992', 'Sales Person')
	INSERT INTO Employees VALUES (95648, 4, 'Naamah', 'Steele', '4068 White Avenue', 62234, '429-507-0909', '7/19/1989', 'Manager')
	INSERT INTO Employees VALUES (56869, 5, 'Shrivatsa', 'Estrada', '2749 Harvest Lane', 90001, '606-034-2819', '8/30/1991', 'Manager')

	
	INSERT INTO ORDERS VALUES (12, 49128, 100, '9/12/2012', 1, 34689, 1)
	INSERT INTO ORDERS VALUES (52, 12384, 159, '3/20/2012', 2, 13479, 2)
	INSERT INTO ORDERS VALUES (82, 59382, 294, '2/6/2012', 3, 12389, 3)
	INSERT INTO ORDERS VALUES (49, 24859, 120, '7/1/2012', 4, 95648, 4)
	INSERT INTO ORDERS VALUES (68, 12398, 604, '5/29/2012', 5, 56869, 5)

	INSERT INTO OrderDetails VALUES (12, 192, '$2,049.00', 'Mid-Grade Boxes')
	INSERT INTO OrderDetails VALUES (52, 102, '$2,592.00', 'Mid-Grade Boxes')
	INSERT INTO OrderDetails VALUES (82, 382, '$4,968.00', 'High-Grade Boxes')
	INSERT INTO OrderDetails VALUES (49, 572, '$1,290.00', 'Low-Grade Boxes')
	INSERT INTO OrderDetails VALUES (68, 239, '$9,284.00', 'High-Grade Boxes')
*/	

/*	Summary Queries

	SELECT MIN(Price) AS [Cheapest Order], 
		   MAX(Price) AS [MostExpensiveOrder],
		   AVG(Price) AS [Average Order Price]
	FROM OrderDetails;
	
	SELECT Employees.EmployeeLast, COUNT(Orders.EmployeeID) AS [Number of Sales]
	FROM (Orders
	INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID)
	GROUP BY EmployeeLast


	Views

	CREATE VIEW OrderCost
	AS
	SELECT OrderNumber, Price
	FROM OrderDetails
	WHERE Price > '2600.00'
	WITH CHECK OPTION;

	USE FinalProject
	SELECT OrderNumber, Price
	FROM OrderCost;

	CREATE VIEW Customer_Order
	AS
	SELECT Customers.CustomerID, CustomerLast, QuantitySold
	FROM Customers
	JOIN [Orders] ON Customers.CustomerID = Orders.CustomerID;

	SELECT CustomerID, CustomerLast, QuantitySold
	FROM Customer_Order;


	Stored Procedures

	CREATE PROC spCustomers
	AS
	SELECT * FROM Customers;
	GO

	EXEC spCustomers;

	CREATE PROC spOrderDetails
	AS
	SELECT OrderNumber, ItemNumber, Price, ItemDesc
	FROM OrderDetails
	WHERE Price > 5000
	GO

	EXEC spOrderDetails;


	User Defined Functions

	CREATE FUNCTION fnShipperID
	(@ShipperID int)
	RETURNS int
	BEGIN
	RETURN (SELECT ShipperID FROM Shippers WHERE ShipperID = @ShipperID);
	END;

	SELECT CustomerID, Ordernumber
	FROM Orders
	WHERE ShipperID = dbo.fnShipperID('1');


	CREATE FUNCTION fnLongestWorkingEmployees
	(@LongestEmployees date = '1990-06-20')
	RETURNS table
	RETURN (SELECT EmployeeFirst, EmployeeLast, HireDate
			FROM Employees	
			WHERE HireDate < @LongestEmployees)

	SELECT * FROM fnLongestWorkingEmployees('1990-6-20')


	Triggers

	CREATE TABLE CustomerLogs(
	CustomerID int,
	status varchar(30)
	);

	CREATE TRIGGER Customers_DELETE ON CustomerLogs
	AFTER DELETE
	AS
	BEGIN
	SET NOCOUNT ON;
	DECLARE @CustomerID int
	SELECT @CustomerID = DELETED.CustomerID
	FROM DELETED

	INSERT INTO CustomerLogs
	VALUES(@CustomerID, 'Deleted')
	END

	CREATE TRIGGER Zipcode_INSERT_UPDATE ON Zipcode
	AFTER INSERT, UPDATE
	AS
	UPDATE Zipcode SET [State] = UPPER([State]);

*/
	
