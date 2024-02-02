create database if not exists classicmodels;
use classicmodels;
-- show databases;
-- DROP TABLE IF EXISTS `offices`;

CREATE TABLE if not exists `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50),
  `state` varchar(50),
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL,
  PRIMARY KEY (`officeCode`)
);
CREATE TABLE if not exists `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
);
CREATE TABLE IF NOT EXISTS `customers` (
  `customerNumber` INT(11) NOT NULL,
  `customerName` VARCHAR(50) NOT NULL,
  `contactLastName` VARCHAR(50) NOT NULL,
  `contactFirstName` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `addressLine1` VARCHAR(50) NOT NULL,
  `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `postalCode` VARCHAR(15) NULL DEFAULT NULL,
  `country` VARCHAR(50) NOT NULL,
  `salesRepEmployeeNumber` INT(11) NULL,
  `creditLimit` DOUBLE NULL DEFAULT NULL,
  `customerLocation` POINT NOT NULL,
  PRIMARY KEY (`customerNumber`),
  FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`));
  
  CREATE TABLE IF NOT EXISTS `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productLine`)
);


CREATE TABLE IF NOT EXISTS `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
);
CREATE TABLE IF NOT EXISTS `Orders` (
  `orderNumber` INT(11) NOT NULL,
  `orderDate` DATETIME NOT NULL,
  `requiredDate` DATETIME NOT NULL,
  `shippedDate` DATETIME NULL DEFAULT NULL,
  `status` VARCHAR(15) NOT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  `customerNumber` INT(11) NOT NULL,
  PRIMARY KEY (`orderNumber`),
  INDEX `fk_Orders_Customers_idx` (`customerNumber` ASC),
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`customerNumber`)
    REFERENCES `ClassicModels`.`Customers` (`customerNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- Create OrderDetails table without foreign key
CREATE TABLE IF NOT EXISTS `OrderDetails` (
  `orderNumber` INT(11) NOT NULL,
  `productCode` VARCHAR(15) NOT NULL,
  `quantityOrdered` INT(11) NOT NULL,
  `priceEach` DOUBLE NOT NULL,
  `orderLineNumber` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`orderNumber`, `productCode`),
  INDEX `fk_OrderDetails_Products_idx` (`productCode` ASC),
  INDEX `fk_OrderDetails_Orders_idx` (`orderNumber` ASC)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Add foreign key constraint separately
ALTER TABLE `OrderDetails`
ADD CONSTRAINT `fk_OrderDetails_Products`
  FOREIGN KEY (`productCode`)
  REFERENCES `products` (`productCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `OrderDetails`
ADD CONSTRAINT `fk_OrderDetails_Orders`
  FOREIGN KEY (`orderNumber`)
  REFERENCES `orders` (`orderNumber`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `Payments` (
  `checkNumber` VARCHAR(50) NOT NULL,
  `paymentDate` DATETIME NOT NULL,
  `amount` DOUBLE NOT NULL,
  `customerNumber` INT(11) NOT NULL,
  PRIMARY KEY (`checkNumber`),
  INDEX `fk_Payments_Customers_idx` (`customerNumber` ASC),
  CONSTRAINT `fk_Payments_Customers`
    FOREIGN KEY (`customerNumber`)
    REFERENCES `Customers` (`customerNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



show tables;
describe offices;
describe employees;











