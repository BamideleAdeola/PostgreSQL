
-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT,
    OrderDate DATE,
    ProductID INT,
    CustomerID INT,
    SalesAmount DECIMAL(10, 2),
    Quantity INT
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100)
	FOREIGN KEY (ProductID) REFERENCES Orders(ProductID)
);	

-- Create the Date table
CREATE TABLE Date (
    Date DATE PRIMARY KEY,
    Weekday VARCHAR(20),
    Year INT,
    Month VARCHAR(20),
    Day INT,
    Holiday INT
	FOREIGN KEY (Date) REFERENCES Orders(OrderDate)
);




