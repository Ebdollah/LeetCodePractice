-- > **EXERCISES**:
use classicmodels;
-- offices: `officeCode` ,`city`,`phone` ,`addressLine1` ,`addressLine2`,`state` , `country` ,`postalCode` ,`territory` 
-- employees: `employeeNumber` , `lastName` , `firstName` , `extension` , `email` , `officeCode` , `reportsTo` , `jobTitle`
-- customers:  `customerNumber`,`customerName` ,`contactLastName` ,`contactFirstName`,`phone`,`addressLine1`,`addressLine2`,`city`,`state`,
--               `postalCode`,`country`,`salesRepEmployeeNumber`,`creditLimit`,`customerLocation`,
-- productlines: `productLine`, `textDescription`, `htmlDescription`, `image`
-- products: `productCode`, `productName`, `productLine`, `productScale`, `productVendor`, `productDescription`, `quantityInStock`, `buyPrice`, `MSRP`

-- > 1. List the customers in the United States with a credit limit higher than \\$1000.
Select customerNumber,customerName
from customers
where country = 'USA' AND creditLimit >= 1000;


-- > 2. List the employee codes for sales representatives of customers in Spain, France and Italy. Make another query to list the 
--   names and email addresses of those employees.

Select salesRepEmployeeNumber
from customers 
Where country IN ( 'Spain' , 'France', 'Italy');

-- Select employees with jobTitle 'Sales Rep'
SELECT employeeNumber, firstName, jobTitle
FROM employees
WHERE jobTitle = 'Sales Rep';

SET SQL_SAFE_UPDATES = 0;

-- Update jobTitle from 'Sales Rep' to 'Sales Representative'
UPDATE employees
SET jobTitle = 'Sales Representative'
WHERE jobTitle = 'Sales Rep';

SELECT employeeNumber, firstName, jobTitle
FROM employees
WHERE jobTitle = 'Sales Representative';

-- > 4. Delete the entries for Sales Representatives working in London.
-- Delete From employees

-- > 5. Show a list of employees who are not sales representatives
-- > 6. Show a list of customers with "Toys" in their name

-- ----------------------------------------------------------------------------------------------------------
-- productlines: `productLine`, `textDescription`, `htmlDescription`, `image`
-- products: `productCode`, `productName`, `productLine`, `productScale`, `productVendor`, `productDescription`, `quantityInStock`,
-- `buyPrice`, `MSRP`
-- Order By
select productName, productVendor
From products
order by productVendor;

-- ORDER BY and LIMIT
-- EXERCISES
-- List the 5 most expensive products from the "Planes" product line

Select productName,productLine,buyPrice
From products
Where productLine = "Planes"
order by buyPrice desc
Limit 5;
-- Identify the products that are about to run out of stock (quantity in stock < 100)]
Select productName,productLine
From products
Where quantityInStock < 100;
-- List 10 products in the "Motorcycles" category with the lowest buy price and more than 1000 units in stock
Select productName,productLine,buyPrice
From products
Where productLine = "Motorcycles" AND quantityInStock > 1000
Order by buyPrice 
Limit 10;

-- -------------------------------------------------------------------------------------------------

Select *
from Orders
Limit 10;

-- -------------------------------------------------------------------------------------------------

Select *
from OrderDetails
Limit 10;

-- -------------------------------------------------------------------------------------------------

Select *
from Payments
Limit 10




