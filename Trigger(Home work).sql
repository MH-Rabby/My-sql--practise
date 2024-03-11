CREATE DATABASE Trigger_class12
go
USE Trigger_class12
go

CREATE TABLE Products
( 
ID int not null IDENTITY,
ProductID int primary key not null,
ProductName varchar(40) not null,
Price money not null,
Quantity int not null default 0
)
go
--Create another table
CREATE TABLE StockIn
(
ID int not null IDENTITY,
ProductID INT REFERENCES Products(productID),
Quantity int not null
)
go
--Insert data
select *from StockIn
go
INSERT INTO Products (ProductID,ProductName,Price,Quantity) VALUES (20,'Keyboard',500,50)
go
INSERT INTO StockIn(ProductID,Quantity) values(20,50)
go
--make trigger 
CREATE TRIGGER Tr_insert
ON stockIn
FOR INSERT
AS
BEGIN
 DECLARE @pid  int 
 DECLARE @qty int 

 SELECT @pid= ProductID,@qty=Quantity FROM inserted

 UPDATE Products set Quantity=@qty+Quantity 
 where ProductID =@pid


END
GO
DROP TRIGGER Tr_insert
GO
--test
select *from StockIn
select *from Products
go
Insert into StockIn (ProductID,Quantity) values (10,20)
GO
INSERT INTO Products(ProductID,ProductName,Price) VALUES (12,'Keyboard',3600)
go

--make another trigger
CREATE TABLE Tbltest
(
id int ,
name varchar (40)
)
go
INSERT INTO Tbltest (id,name) VALUES (1,'oil')
GO

CREATE TRIGGER Tr_delete
ON Tbltest
FOR UPDATE,DELETE
AS
BEGIN
PRINT'Delete &UPDATE Not Possible'
ROLLBACK TRANSACTION
END
GO 

/*
Now Home work Here
Make a sales table and When One Data Insert In Sales table then Automaticly
it will Minious from  Products And Stock table
*/
CREATE TABLE Sales
(
ID int IDENTITY,
ProductID INT REFERENCES Products (ProductID),
SalesDate DATETIME DEFAULT GETDATE(),
Price MONEY NOT NULL,
Quantity int not null
)
go
---Make trigger 
CREATE TRIGGER TR_salesMinious
ON sales
For INSERT
AS
BEGIN

 DECLARE @pid int
 DECLARE @qty int
 
 SELECT @pid=ProductID,@qty=Quantity FROM inserted

 UPDATE Products SET Quantity=@qty-Quantity 
 WHERE @pid=ProductID
 
 UPDATE StockIn SET quantity =@qty-Quantity
 where @pid=ProductID

END
GO
--test
SELECT *FROM Sales
GO
INSERT INTO Sales (ProductID,Price,Quantity) VALUES (20,800,10)
GO
SELECT *FROM SALES
SELECT *FROM Products
SELECT *FROM StockIn
GO

/*
Instead of Trigger
*/
CREATE TABLE Sale
(
Id int IDENTITY,
ProductId int not null PRIMARY KEY,
UnitPrice MONEY not null,
Quantity int not null,
TotalAmount as Quantity*unitprice
)
go

INSERT INTO Sale (ProductId,UnitPrice,Quantity) VALUES (1,500,20)
GO

SELECT *FROM Sale
GO

--VIEW

CREATE VIEW VSALE
AS
SELECT *FROM Sale
GO


--INSTEAD OF TRIGGER
CREATE TRIGGER Tr_instede
ON VSALE
INSTEAD OF INSERT
AS
BEGIN
 INSERT INTO VSALE (ProductId,UnitPrice,Quantity)
 SELECT  ProductId,UnitPrice,Quantity FROM inserted
END
GO
drop trigger Tr_instede
go
--TEST
select *from Sale
go
INSERT INTO VSALE values (3,4,800,30,145587)
go
--THE END

 
