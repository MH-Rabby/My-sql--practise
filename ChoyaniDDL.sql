/*
					SQL Project Name : E-Commerce Business Management System(Choyani Mart)
							    Trainee Name : Mehedi Hasan Rabby 						    	       
							         Batch : WUST PGD-MUAD 03

 -----------------------------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database  With file location.
			=> SECTION 02: Created  Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


------SECTION 01-----
------Create Database With file location-------
CREATE DATABASE ChoyaniMart
ON
(
 NAME='ChoyaniMartlog' ,
 FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\choyani.ldf',
 SIZE =20MB ,
 MAXSIZE=25MB,
 FILEGROWTH=10MB
)
LOG ON 
(
  NAME='ChoyaniMartdata' ,
 FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\choyani.mdf',
 SIZE =20MB ,
 MAXSIZE=25MB,
 FILEGROWTH=10MB
)
go
-----====SECTION 02: Created  Tables with column definition related to the project-----=========
USE ChoyaniMart
GO


CREATE TABLE Customers
(
 CustomerID int not null PRIMARY KEY,
 CustomerName varchar(70) not null,
 [Password] varchar (7) ,
 Email varchar (70) not null,
 FullName varchar (70) not null,
 [Address] varchar ( 100) not null,
 PhoneNumber varchar (11) not null,
 RagistationDate Datetime Default GETDATE() 
)
GO


select *from customers
go

Create table Catagoryes
(
CategoryId int not null Primary key,
CatagoryName varchar (70) not null
)
GO

Select *from Catagoryes
go

Create table Supplyers
(
SupplyerId int not null Primary key,
SupplyerName varchar(50) not null ,
[Address] varchar (100) not null,
ContactNumber varchar (11) not null,
Email varchar(70) not null
)
go

select *from Supplyers
go

CREATE TABLE Products
(
 ProductId int not null Primary key,
 ProductName varchar(70) not null,
 CatagoryId int References catagoryes(CategoryId),
 SypplyerID int References Supplyers (SupplyerId),
 Price Money not null,
 QuantityInStock int not null Default 0
)
go

Select *from Products
go

Create table Brands
(
BrandId int primary key,
BrandName varchar(70)not null
)
go

Create table Orders
(
 OrderId int Primary key,
 CustomerId int References Customers(customerID),
 OrderDate Datetime not null Default Getdate(),
 Unitprice Money not null,
 Quantity int not null,
 Discount decimal (10,2) not null,
 TotalPrice as(unitprice*quantity*(1-discount)),
 PaymentMethod varchar (50) not null,
 BrandId int References Brands(brandId)
)
Go

Select *from Orders
GO

Create table CartItem
(
 CartId int not null primary key,
 ProductId int References Products(productiD),
 Quantity int not null,
 CustomerID int References customers(customerID),
 Branid int References Brands (BrandId)
)
Go

select *from CartItem
go

Create table PaymentTranjection
(
TranjectionId int primary key,
OrderID int References Orders (orderid),
TranjectionDate datetime not null default getdate(),
CustomerID INT References customers(customerID),
Amount decimal(10,2) not null,
PaymentMethod varchar(70) not null,
[Status] varchar(30) not null--paid or due
)
go

select *from PaymentTranjection
go

Create table Reviews
(
 ReviewId int not null,
 CustomerId int References products(productId),
 ProductID int references products(Productid),
 Rating int not null,
 Comments varchar(200) not null,
 ReviewData datetime null
 )
 go

 select *from Reviews
 go

 create table Designations
 (
 DesignationId INT primary key,
 Designation varchar(50) not null
 )
 go

select *from Designations
go

 create table Employees
(
EmployeeID INT not null primary key,
EmployeeName varchar(70) not null,
PhoneNumber varchar (11) not null,
DesignationId int References Designations(DesignationId),
Email varchar(100) not null,
[Address] varchar(100) not null,
JoinDate DateTime not null
)
go

select *from Employees
go

Create table Salaryes
(
SalaryId int not null Primary key,
Salary Money not null,
EmployeeId int references Employees(EmployeeID),
DesignationId int references Designations(DesignationId)
)
go

Select *from Salaryes
go

Create table Promotions
(
PromotionId int primary key,
Promotiontype varchar(70) not null,
StartDate datetime not null,
EndDate datetime not null
)
go

select *FROM Promotions
GO

Create table ShippingMethod
(
ShippingMethodId int not null primary key,
OrderId int references orders(orderid),
Shippingtype varchar (70) not null,
Cost money not null
)
go

select *from ShippingMethod
go

Create table ShipingComplete
(
ShipCompleteId int not null primary key,
OrderId int references Orders(orderID),
ShippingMethodId int references ShippingMethod(ShippingMethodId),
ShipDate datetime not null
)
go

Select*from ShipingComplete
go

Create table sales
(
SalesId int identity primary key,
ProdutId int references products(productid),
Quantity int not null,
Unitprice money not null,
Salesdate datetime default getdate(),
CustomerName varchar(70)not null
)
go


select *from sales
go

Create table [Returns]
(
 ReturnsId int primary key,
 OrderId int references orders(orderid),
 ProductId  int references Products(productid),
 CustomerId int references customers(customerid),
 ReturnReason varchar(200)not null,
 ReturnDate datetime not null
)
go

select *from [Returns]
go

Create table StockIn
(
StockId int primary key,
ProductId int references Products(ProductId),
ProductName varchar(100) not null,
StockDate Datetime not null,
Quantity int not null,
Unitprice Money not null,
supplierName varchar(100) not null
)
go
--------Add constraint on customer table ------------
alter table customers
add constraint ck_password1 check ([Password] like '[A-z],[A-z],[0-9],[0-9],[0-9],[0-9],[0-9]')
go






/*
=============================> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS=====================
*/
select *from Brands
go
---Alter Table --
Alter table Brands
Alter column  BrandName varchar(55)not null
go
----Update table data-----
update ShippingMethod
set shippingtype ='By Delivery Man'
where Shippingtype='By cycle'
go

-----Update StockIn table----------
Update StockIn
set ProductName='Ardiono Uno'
where StockId=3
go
-----Drop table --
Drop table Brands
Go
---Modify Table ---
Alter table Cartitem 
add curtname varchar(50) not null
Go

Alter table stockIn
Add serioulNo int identity not null
go

Alter table [Returns]
add Quantity int not null default 0
go
/*
---------------=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX-----------------------------
*/
--Create clustered index
Create Clustered index In_cart
ON Cartitem (cartid)
Go

--Crete Non-Clustered index
Create nonClustered index in_Reviews
ON Reviews(Reviewid)
Go
/*
---------------------=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE----------------------------------
*/
--------Create sequence
Create sequence Sk_products
as int
start with 1
increment by 1
GO

----Update Sequence
Alter Sequence Sk_products
increment by 2
Go

/*
--------------------------=> SECTION 06: CREATE A VIEW & ALTER VIEW---------------------------------  
*/
--Create view on Employee table
Create View V_employeelist
as
select EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate from employees
go

select *from V_employeelist
go
-----Alter view V_employeelist----------

Alter View V_employeelist
with ENCRYPTION----(There will add Schemabinding)---
as
select EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate from employees
go

------Update data through a view(V_employeelist)----

update  V_employeelist
set designationId =2
where employeeid=13
go


---Create view on product and catagory table with joining--

select *from Products
select *from Catagoryes
go

Create view V_showProductwithCatagoryName 
as
select productid,productname,catagoryName,price from Products p
Inner join Catagoryes c
on
p.CatagoryId=c.CategoryId
go
--test--------------------------------------
select *from V_showProductwithCatagoryName
go

--Test view------------
select *FROM V_employeelist
GO

---Alter view on Employee table

Alter view V_employeelist
as
select *from employees
go

--test 
select *from V_employeelist
go

/*
------------------=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
*/
--Create sp for Data Show

Create proc sp_DataShow
AS
Select *From Employees
go
--Test
EXEC sp_DataShow
GO

------Update data thorgh Store Proc-------------------------------

Create Proc Sp_updateDataInemployees @employeeId int, 
                                     @employeeName varchar(70),
									 @address varchar(70)
as
Begin
Update  Employees 
set Address=@address
Where EmployeeID=@employeeId and EmployeeName=@employeeName
End
go

-----Delete Data Though Store proc-----------------

select *from Reviews
go

Create proc sp_deleteFromReview @ReviweId int 
As
Begin 

 Delete from Reviews
 where ReviewId=@ReviweId

End
go
------------Store Proc with raise error and try catch-----------------------------------

Create proc sp_raisError
as 
begin
begin try
delete from Employees---at first make a trigger for (can not delete data)
end try

begin catch
declare @error varchar(200) ='Error'+convert (varchar ,error_number(),1)+':'+ ERROR_MESSAGE()
RAISERROR(@error,1,1)
end catch

end
Go

---Create Sp for insert data into Designation table
-------------------------------------------------------------------------------------------------===============================================================================================
select *from Designations
go

Create proc sp_insertDesignation @designationID INT,
                                     @Designation varchar(30)

as
Begin
Insert into Designations (Designationid,Designation) values (@designationID,@Designation)
END
GO
---TEST
EXEC sp_insertDesignation 1,'Marketer'
Exec sp_insertDesignation 2,'DeliveryMan'
Exec sp_insertDesignation 3,'SalesMan'
Exec sp_insertDesignation 4,'Manager'


go

--Create sp for Employees Table to insert data table
---------------------------------------------------------------------------------------------===============================================================================================

Create proc sp_datainsertintoemployees @employeeID INT ,
                                       @EmployeeName varchar(70),
									   @phoneNumber varchar(11),
									   @DesignationId int,
									   @email varchar(70),
									   @address varchar(100),
									   @joindate datetime
as
Insert into Employees(EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate) VALUES
(@employeeID,@EmployeeName,@phoneNumber,@DesignationId,@email,@address,@joindate)
go
--TEST
exec sp_datainsertintoemployees 1,'Ovilash Datta Rup','01991237738',1,'ovilashdatta23@gmail.com','ThanaPara','2020-2-12'

exec sp_datainsertintoemployees 2,'Rejowan  Hossain' ,'01762379781',1,'ridoyhossain@gmail.com','Bogra','2012-2-16'
exec sp_datainsertintoemployees 3,'Mehedi Hasan Rabby','01991237738',3,'mhrabby103712@gmail.com','Narsingdi','2019-1-19'
exec sp_datainsertintoemployees 4,'Krisna Kamal','01371238483',2,'krisnakamal1234@gmail.com','Lalmonirhat','2016-4-17'

select *from Employees
go

--Create sp for Customers Table to insert data table--------------------------------------------------

select *from Customers
go

Create proc sp_insertintocustomer @customerId int ,
                                  @CustomerName varchar(70),
								  @password varchar(7),
								  @Email varchar(100),
								  @fullname varchar(70) ,
								  @address varchar(100),
								  @phoneNumber varchar(11),
								  @RagistationDate datetime 
as
Begin
Insert into Customers (CustomerID,CustomerName,Password,Email,FullName,Address,PhoneNumber,RagistationDate)
VALUES(@customerId,@CustomerName,@password,@Email,@fullname,@address,@phoneNumber,@RagistationDate)
End

-----Test  sp_insertintocustomer----------------------------------------------------------------
exec sp_insertintocustomer 1,'Rabby','pa12371','mhrabby103712@gmail.com','Mehedi Hasan','Narsingdi','01912371237','2020-2-12'

go

--Create sp for Catagorys Table to insert data table--------------------------------------------

select *from Catagoryes
go


Create proc sp_insertintocatagoryes @catagoryid int ,
                                    @catagoryName varchar(70)
as
Begin
insert into Catagoryes (CategoryId,CatagoryName) values (@catagoryid,@catagoryName)
end
go

----Test----------------------------------------------------------------------------------------
exec sp_insertintocatagoryes 1,'Grosary'
go


----Create sp for Supplyer Table to insert data table-----------------------------------------

Select * from Supplyers
go

Create proc sp_insertintosupplyer @supplyerId int,
                                  @supplyerName varchar(70),
								  @Address varchar(100),
								  @ContactNumber varchar(100),
								  @email varchar(100)
AS
Begin
insert into Supplyers( SupplyerId,SupplyerName,Address,ContactNumber,Email) values (@supplyerId,@supplyerName,@Address,@ContactNumber,@email)

End
go


--test------------------------------------------------------------------------------------------
exec sp_insertintosupplyer 1,'Maruf','Narsingdi',0191237560,'maruf10352@gmail.com' 


--Create sp for Products Table to insert data table----------------------------------------------


SELECT *FROM Products
GO

create proc sp_insertintoproducts @productid int  ,
                                  @producName varchar(70) ,
								  @Catagoryid int,
								  @supplyerID int,
								  @price money,
								  @quantityinstock int
as
Begin
insert into Products (ProductId,ProductName,CatagoryId,SypplyerID,Price,QuantityInStock) values ( @productid,@producName,@Catagoryid,@supplyerID,@price,@quantityinstock)
end
GO

----Test-----------------------------------------------------------------------------------------
exec sp_insertintoproducts 1,'Egg',1,1,38,40000
go


--Create sp for Brand Table to insert data table------------------------------------------------
select *from Brands
go

Create proc sp_insertintoBrands @BrandId int ,
                                @BrandName varchar(70)
AS
Begin 
Insert into Brands(brandid,brandName) values ( @BrandId,@BrandName)  
End

---test-------------------
exec sp_insertintoBrands 1,'Nikee' 

--Create sp for Brand Table to insert data table------------------------------------------------------

select *from CartItem
go

Create proc sp_insertintocartitem @cartid int ,
                                  @productid int,
								  @quantity int,
								  @customerid int,
								  @brandid int
AS
Begin
insert into CartItem (CartId,ProductId,Quantity,CustomerID,Branid) Values ( @cartid,@productid,@quantity,@customerid,@brandid)
END
GO
--Test-------------------------------
exec sp_insertintocartitem 1,1,10,1,1

--Create sp for orders Table to insert data table-----------------------------------------------------

select *from Orders
go

Create proc sp_insertintoOrders @orderiD INT,
                                @Customerid int,
								@orderdate datetime,
								@unitprice money,
								@quantity int,
								@discount decimal,
								@paymentMathod varchar(30) ,
								@brandID INT
as
begin 
insert into orders(Orderid,CustomerId,OrderDate,Unitprice,Quantity,Discount,PaymentMethod,BrandId)
values (@orderid,@Customerid,@orderdate,@unitprice,@quantity,@discount,@paymentMathod,@brandID)
end
go

----Test--------------------------------------
exec sp_insertintoOrders 1,1,'2020-10-2',80,10,0.00,'Cash',1

--Create sp for PaymentTranjection Table to insert data table-----------------------------------------

select *from  PaymentTranjection
GO

Create proc sp_insertintoPaymentTranjection @TranjectionId int,
                                            @orderid int ,
											@tranjectionDate datetime ,
											@customerid int,
											@amount decimal,
											@paymentMathod varchar(70),
											@status varchar(70)
AS
Begin
Insert into PaymentTranjection(TranjectionId,OrderID,TranjectionDate,CustomerID,Amount,PaymentMethod,Status)
values (@TranjectionId,@orderid,@tranjectionDate,@customerid,@amount,@paymentMathod,@status)
End
GO	

--Test--------------------------------------------------
exec sp_insertintoPaymentTranjection 1,1,'2020-10-2',1,80.0,'HandCash','Paid'


-----Create sp for Promotion Table to insert data table--------------------------------------
select *FROM Promotions
GO

Create proc sp_insertintoPromotion @promotionId int ,
                                   @promotiontype varchar(70),
								   @startdate datetime ,
								   @endDate datetime 
As
Begin
Insert into Promotions (PromotionId,Promotiontype,StartDate,EndDate) 
values ( @promotionId,@promotiontype,@startdate,@endDate)
End
Go

----Test--------------------------------------------------
exec sp_insertintoPromotion 1,'Facebook Ads','2023-10-12','2023-10-15'
go

----Create sp for Returns Table to insert data table--------------------------------------------
select *from [Returns]
go

Create proc sp_insertintoReturns @returnsId int,
                                 @orderid int,
								 @productid int,
								 @customerid int,
								 @returnreason varchar(100),
								 @returndate datetime
As
Begin
Insert into [Returns] (ReturnsId,OrderId,ProductId,CustomerId,ReturnReason,ReturnDate) 
Values (@returnsId,@orderid,@productid,@customerid,@returnreason,@returndate)
End
go

---Test------------------------------------------------
exec sp_insertintoReturns 1,1,1,1,'Broken','2020-2-10'

----Create sp for Reviews Table to insert data table----------------------------------------

select *from Reviews
go

Create proc sp_insertintoReviews @ReviewId int,
                                 @Customerid int,
								 @Productid int,
								 @Rating int,
								 @comments varchar(200),
								 @reviewDate datetime
As 
Begin
Insert into Reviews(ReviewId,CustomerId,ProductID,Rating,Comments,ReviewData) 
Values ( @ReviewId,@Customerid,@Productid,@Rating,@comments,@reviewDate)
End
Go

-----Test----------------------------------------------
Exec sp_insertintoReviews 1,1,1,5,'Too Good','2020-10-2'


----Create sp for Salaryes Table to insert data table--------------------------------------

select *from Salaryes
go

Create proc sp_insertintosalaryes @salaryID int,
                                  @salary money,
								  @employeeID int,
								  @designationID INT
as
Begin
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId)
Values (@salaryID,@salary,@employeeID,@designationID)
End
GO

---Test----------------------------------------------
Exec sp_insertintosalaryes 1,80000,1,1
go


----Create sp for ShippingMethod Table to insert data table---------------------------------
select *from ShippingMethod
go

Create proc sp_insertintoshippingmethod @shippingMethodId int ,
                                        @orderID INT ,
										@shippingtype varchar(70),
										@cost money 
As
Begin 
Insert into ShippingMethod (ShippingMethodId,OrderId,Shippingtype,Cost)
values (@shippingMethodId,@orderID,@shippingtype,@cost)
end
go

---Test--------------------------------------------------------------
exec sp_insertintoshippingmethod 1,1,'By Cycle',30

----Create sp for ShippingComplete Table to insert data table-------------------------------

select *from ShipingComplete
go

Create proc sp_insertintoshippingcomplete @shipcompleteId int,
                                          @orderId int,
										  @shippingMethodId int,
										  @shipdate datetime
AS
Begin
Insert into ShipingComplete(ShipCompleteId,OrderId,ShippingMethodId,ShipDate) 
values (@shipcompleteId,@orderId,@shippingMethodId,@shipdate)
End
go

---Test----------------------------------
exec sp_insertintoshippingcomplete 1,1,1,'2020-10-2'
Go



-------------------------------Store proc with output peramitter---------------------

select *from StockIn
go

Create proc sp_stockinoutputperam @stockid int ,
                                  @productid int ,
								  @productName varchar(70),
								  @stockDate datetime ,
								  @quantity int ,
								  @unitprice Money,
								  @SupplierName varchar(70),
								  @serioulNo int output
As
Begin
Insert into StockIn values (@stockid,@productid,@productName,@stockDate,@quantity,@unitprice,@SupplierName)
select @serioulNo=ident_current ('StockIn')
End
GO
drop proc sp_stockinoutputperam
go

---Test----------------------------
declare @laststockIN INT
exec sp_stockinoutputperam 7,1,'egg','2020-2-10',80,30,'Emon',@laststockIN output
select @laststockIN 'lastid'
go

/*
SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
-----------------------------------------------------------------------------------------------
*/
----Create Scalar Function-----------------------------------------

Create function fn_priceCalculate ( @unitprice money ,
                                    @quantity int,
									@discount decimal)
Returns money
AS
Begin
Declare @totalPriceMoney money
select @totalPriceMoney=@unitprice*@quantity*(1-@discount)
Return @totalPriceMoney
End
go

---Test--------------------------
select dbo.fn_priceCalculate(800,5,0.15) 'total price'
go
--------------------SIMPLE TABLE VALUED---------------------------------------------------
select *from Orders
go

Create function fn_tablevaluedfromOrder (@year int, @month int)
returns Money
as
Begin 
declare @totalsale money
select @totalsale=unitprice*quantity from Orders
where year(OrderDate)=@year and month(OrderDate)=@month
return @totalsale
end
go
---Test-------------------------------------------------

select dbo.fn_tablevaluedfromOrder (2020,10) as 'total sale'

------MULTISTATEMENT TABLE VALUED--------------------------------------------------------
select *from Orders
go

Create function fn_multistatementTableValueOrders (@year int ,@month int)
returns table 
as 
Return
(
select
sum(unitprice*quantity*1-discount)'total sale',
sum (unitprice*quantity) 'sale without discount',
sum (unitprice*quantity*discount) 'total discount'
from Orders
where year(orderdate)=@year and month(orderdate)=@month
)
go

select * from fn_multistatementTableValueOrders (2020,10)
go

/*
 ---------------SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)------------------------------
*/
------Create for/after trigger for salary table---------------------------------------------


select *from Salaryes
go

Create trigger tr_forsalary 
on Salaryes
for delete
as
begin
print'Delete not possible from this table'
rollback transaction
end
go

---test trigger--------------

delete from Salaryes where SalaryId=1
go

---Another trigger-----------------------------------------------------------

select *From stockin
select *from Returns
go

Create trigger tr_returnstostockin 
on [Returns]
for insert
as
begin
declare @productid int 
declare @quantity int
select @productid =productid,@quantity=quantity from inserted
update StockIn set Quantity=@quantity+Quantity
where @productid=ProductId
end

----test----------------------------------------------------
insert into Returns values (2,1,1,1,'Problem','2024-3-25',50)
go

/*
	SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
-----------------------------------------------------------------------------------------------	
*/
select *from Employees
select *from V_employeelist
go

Create trigger tr_instateOf --It is need for insert data view and table in a same time 
on V_employeelist --it will work when this view based on one table
INSTEAD of Insert
as
begin
insert into V_employeelist(EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate)
select EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate from inserted
end
go

---Test----------------------
insert into V_employeelist values (5,'AnuwarMia','01315254563',1,'anuwarmia12345@gmail.com','Kamarpara','2023-4-12')
go

/*
============================DDL part Over Here==============================================
*/
