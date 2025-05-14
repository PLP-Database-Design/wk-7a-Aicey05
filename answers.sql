-- Creating a new table for 1NF transformation
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Inserting data into the 1NF table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');
    
-- Select data from the new 1NF table
SELECT * FROM ProductDetail_1NF;


-- Creating the Orders table (for removing partial dependencies)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Inserting data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Creating the OrderItems table (for storing product and quantity information)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Select data from the Orders table
SELECT * FROM Orders;

-- Select data from the OrderItems table
SELECT * FROM OrderItems;
