-- Homework 8

-- Q1. Using Products table, find the total number of products available in each category.

SELECT Category,
COUNT(*) FROM Products
GROUP BY Category;

-- Q2 Using Products table, get the average price of products in the 'Electronics' category.

SELECT Category,
AVG (Price) from Products
GROUP BY Category
HAVING Category = 'Electronics';


-- Q3 Using Customers table, list all customers from cities that start with 'L'.

SELECT * FROM Customers
WHERE City LIKE  'L%';

-- Q4 Using Products table, get all product names that end with 'er'.

SELECT * FROM Products
WHERE ProductName LIKE '%er';

-- Q5 Using Customers table, list all customers from countries ending in 'A'.

 SELECT * FROM Customers
 WHERE Country LIKE '%A';

 -- Q6 Using Products table, show the highest price among all products.
 SELECT TOP 1* FROM Products
 ORDER BY Price DESC;

 -- Q7 Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
 
SELECT  *, IIF (StockQuantity <30,'Low Stock', 'Sufficient') FROM Products;

-- Q8 Using Customers table, find the total number of customers in each country.

SELECT Country,
COUNT (CustomerID) FROM Customers
GROUP BY Country;

-- Q9 Using Orders table, find the minimum and maximum quantity ordered.
Select MAX(Quantity) Max_Quantity,MIN (Quantity) Min_Quantity FROM Orders;

-- Q10 Using Orders and Invoices tables, list customer IDs 
--who placed orders in 2023 (using EXCEPT) to find those who did not have invoices.

select * from Orders
select * from Invoices

SELECT CustomerID, OrderDate FROM Orders 
WHERE YEAR (OrderDate) = '2023' 
EXCEPT
SELECT CustomerID, InvoiceDate FROM Invoices;

--Q11 Using Products and Products_Discounted table, 
-- Combine all product names from Products and Products_Discounted including duplicates.

SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

--Q12 Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
SELECT ProductName FROM Products
UNION 
SELECT ProductName FROM Products_Discounted;

--Q13 Using Orders table, find the average order amount by year.


SELECT YEAR (OrderDate),
AVG (TotalAmount) FROM Orders
GROUP BY YEAR (OrderDate)

-- Q14 Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). 
-- Return productname and pricegroup. 

SELECT ProductName, CASE WHEN Price <100 THEN 'Low' WHEN Price BETWEEN 100 AND 500 THEN 'Mid' ELSE 'High'END AS pricegroup FROM Products;

-- Q15 Using Customers table, list all unique cities where customers live, sorted alphabetically.

SELECT DISTINCT City FROM Customers;

-- Q16. Using Sales table, find total sales per product Id.

SELECT ProductID,
SUM (SaleAmount) FROM Sales
GROUP BY ProductID;

-- Q17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
SELECT ProductName FROM Products
WHERE ProductName LIKE '%oo%';

-- Q18. Using Products and Products_Discounted tables, compare product IDs using INTERSECT.

SELECT ProductID FROM Products
INTERSECT
SELECT ProductID FROM Products_Discounted;

-- Q19. Using Invoices table, show top 3 customers with the highest total invoice amount. 
--Return CustomerID and Totalspent.


SELECT TOP 3 CustomerID,
SUM (TotalAmount) invoice_amount FROM Invoices
GROUP BY CustomerID
ORDER BY invoice_amount DESC

--Q 20 Find product ID and productname that are present in Products but not in Products_Discounted.

SELECT ProductID, ProductName FROM Products
EXCEPT
SELECT ProductID, ProductName FROM Products_Discounted;

-- Q 21 Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)


select * from Products
select * from Sales

SELECT 
    p.ProductName,
    COUNT(s.ProductID) AS TimesSold
FROM 
    Products p
LEFT JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TimesSold DESC;

-- Q 22. Using Orders table, find top 5 products (by ProductID) with the highest order quantities.


SELECT TOP 5 ProductID,
SUM (Quantity) Highest_Order FROM Orders
GROUP BY ProductID
ORDER BY Highest_Order DESC;