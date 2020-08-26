-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT "productName", "CategoryName" FROM "Product"

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT "Order"."Id", "Shipper"."CompanyName" 
FROM "Order"
JOIN "Shipper" ON "Order"."ShipVia"="Shipper"."Id"
WHERE "Order"."OrderDate" < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o."Quantity", p."ProductName"
FROM "OrderDetail" AS o
JOIN "Product" AS p ON o."ProductId"= p."Id"
WHERE o."OrderId" = "10251"
GROUP BY p."ProductName";

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT 
	o."Id" "OrderID", 
	c."CompanyName" "Customer's Company Name", 
	e."LastName" "Employee Last Name"
FROM "Order" AS o
JOIN "Customer" AS c ON o."CustomerId" = c."Id"
JOIN "Employee" AS e ON o."EmployeeId" = e."Id";
