/*

					SQL Project Name : E-Commerce Business Management System(Choyani Mart)
							    Trainee Name : Mehedi Hasan Rabby   						   
							     Batch:  Batch : WUST PGD-MUAD 03 

 -------------------------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW				
				SUB SECTION => 7.03 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.04 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.05 : OUTER JOIN
				SUB SECTION => 7.06 : CROSS JOIN
				SUB SECTION => 7.07 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.08 : DISTINCT
				SUB SECTION => 7.09 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.10 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE--need help from sir.
				SUB SECTION => 7.11 : OFFSET FETCH
				SUB SECTION => 7.12 : UNION
				SUB SECTION => 7.13 : EXCEPT INTERSECT
				SUB SECTION => 7.14 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.15 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.16 : IF ELSE & PRINT				
				SUB SECTION => 7.17 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.18 : EXISTS								
				SUB SECTION => 7.19 : BUILT IN FUNCTION			
				SUB SECTION => 7.20 : WHILE				
				SUB SECTION => 7.21 : TRY CATCH
				SUB SECTION => 7.22 : GOTO				
				SUB SECTION => 7.23 : sp_helptext
			
*/
/*
==============> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD =========================
--------------------------------------------------------------------------------------------
*/
-----------Inesert into Brand Table--------------------
Use ChoyaniMart
go

Select *from Brands
go

Insert into Brands(BrandId,BrandName) values (2,'Puma')
Insert into Brands(BrandId,BrandName) values (3,'Adidas')
Insert into Brands(BrandId,BrandName) values (4,'Reebok')
Insert into Brands(BrandId,BrandName) values (5,'Bata')
go
------Insert into Customer Table----------------
Select *from Customers
go

Insert into Customers  values (2,'Nafish','Na14523','nafish123@gmail.com','Nafish Iqbal','Jamalpur','01315623562','2024-3-26')
Insert into Customers  values (3,'Tamim','Ta36251','tamim7896@gmail.com','Tamim Iqbal','Narayangonj','01235625392','2024-2-12')
Insert into Customers  values (4,'Tamanna','Kh45693','tamannakhatun1235@gmail.com','Tamanna khatun','Kamargoan','01325623725','2022-5-25')
Insert into Customers  values (5,'Risad','Rs12345','risatmia5263@gmail.com','Risat Mia','Noagoan','01345626512','2023-6-18')
Insert into Customers  values (6,'Kamal','Ka12351','kamalmia1425@gmail.com','Kamal Mia','Pirojpur','01936256352','2022-1-16')
Insert into Customers  values (7,'Minar','Mn12345','minar1252@gmail.com','Minar Rahman','Shatkhira','01352563221','2020-2-25')
go

----Insert into Catagoryes table----------------
select *FROM Catagoryes
GO

Insert into Catagoryes values (2 ,'Gents Clots')
Insert into Catagoryes values (3 ,'Electronics')
Insert into Catagoryes values (4 ,'Home Goods')
Insert into Catagoryes values (5 ,'Health and Beauty')
Insert into Catagoryes values (6 ,'Automotive')
go

------Insert into supplyers table-------------
select *from Supplyers
go

Insert into Supplyers Values(2,'Kamal','Sylhet','01912352636','kamalhossian103712@gamil.com')
Insert into Supplyers Values(3,'Jamal Hossan','Manikgonj','01936529685','Jamalmia1034@gamil.com')
Insert into Supplyers Values(4,'Ripon Mia','Kapasia','01712356253','riponmia1235@gamil.com')
Insert into Supplyers Values(5,'Abir Khan','Tangail','01941526352','abirmia1235@gamil.com')
Insert into Supplyers Values(6,'Ripan Hossain','Tomaltola','01956238956','Riponhossain12@gamil.com')
Insert into Supplyers Values(2,'Joshim Mia','Sylhet','01314912640','joshimemia253698@gamil.com')

GO
----Insert into Product table--------------
select *from Products
go
select *from Catagoryes
go
select *from Supplyers
go

Insert into Products values(2,'T-Shirt',2,3,850,200)
Insert into Products values(3,'Ardionu Uno',3,2,650,100)
insert into Products values(4,'12v Charger',3,3,320,150)
insert into Products values(5,'Washing Masine',4,5,350000,10)
Insert into products values(6,'Soap',5,1,50,100)
insert into Products values(7,'Car Washer',6,3,100,150)
insert into Products values(8,'Peste',5,5,25,100)
insert into Products values(9,'Shocks',2,6,30,150)
insert into Products values (10,'Ligth',6,5,1500,100)
Go

----------Insert data into Employees table---------------------
select *from Employees
go
select *from Designations
go

Insert into Employees values (6,'Nafisa Kamal','01715623526','2','nafisakamal1234@gmail.com','Dhanmondi','2023-02-15')
Insert into Employees values (7,'Sufia Kamal','01315265969','4','sufiasukhi1236@gmail.com','Sylhet','2024-12-02')
insert into Employees values (8,'Arif Azad','01536965858','1','arifullah1236@gmail.com','Muhammadpur','2021-02-12')

go
-----Insert into Orders table-----------------
select *from orders
go

Insert into orders values (2,2,'2024-3-12',800,10,0.00,'Mobile Banking(bkahs)',2)
Insert into orders values (3,3,'2023-2-16',650,5,0.00,'Mobile Banking(Nagad)',3)
Insert into orders values (4,4,'2022-4-10',500,15,0.00,'Cash',2)
Insert into orders values (5,5,'2023-5-01',500,20,0.10,'Cash',4)
Insert into orders values (6,6,'2020-3-12',800,10,0.15,'Bank(dbdl)',1)
Insert into orders values (7,7,'2024-3-12',800,10,0.00,'Bank(Rupali)',1)
Insert into orders values (8,5,'2024-3-12',800,10,0.50,'Mobile Banking(bkash)',2)
go

------------Insert into payment Tranject-------------------
select *from PaymentTranjection
go

Insert into PaymentTranjection  values ( 2,2,'2020-4-6',2,800,'Handcash','Paid')
Insert into PaymentTranjection  values ( 3,3,'2023-5-12',3,400,'Handcash','Paid')
Insert into PaymentTranjection  values ( 4,1,'2024-5-12',5,900,'Bkash','Paid')
Insert into PaymentTranjection  values ( 5,4,'2024-7-5',5,600,'Dou','Dou')
Insert into PaymentTranjection  values ( 6,5,'2023-6-6',3,700,'Dou','Dou')
Insert into PaymentTranjection  values ( 7,3,'2020-4-6',2,900,'Handcash','Paid')

------Insert into Promotion table -------------------
Select *from Promotions
go

Insert into Promotions values (2,'Google Ads Campain','2024-3-10','2024-3-16')
Insert into Promotions values (3,'Instragram Ads Campain','2024-3-10','2024-3-16')
Insert into Promotions values (4,'Game Sponsorship','2024-3-10','2024-3-16')
Insert into Promotions values (5,'Brand Ambasidor','2024-3-10','2024-3-10')
Insert into Promotions values (6,'Lifelet','2024-3-15','2024-3-15')
Insert into Promotions values (7,'Facebook Ads Campain','2024-3-15','2024-3-25')
Insert into Promotions values (8,'Google Ads Campain','2024-3-10','2024-3-16')
Go

-------------Insert into Returns table--------------
Select *from Returns
go

Insert into Returns values (3,2,2,2,'Broken','2024-3-12',20)
Insert into Returns values (4,3,3,4,'Scrach','2024-3-16',50)

Go
---------------Insert into Review table----------------
select *from Reviews
go

Insert into Reviews values ( 2,3,4,5,'Too Good','2024-02-12')
Insert into Reviews values ( 3,4,2,5,'Too Good','2024-02-12')
Insert into Reviews values ( 4,2,3,2,'Bad','2024-02-12')
Insert into Reviews values ( 5,5,4,3,'Good','2024-02-12')
Insert into Reviews values ( 6,3,5,5,'Too Good','2024-02-12')
Insert into Reviews values ( 7,1,6,4,' Good','2024-02-12')
go

----------------Insert into Salaryes Table -----------------------
Select *from Salaryes
select *from Employees
go

Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (2,50000,2,2)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (3,20000,3,3)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (4,25000,4,4)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (5,30000,5,2)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (6,18000,6,3)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (7,28000,7,2)
Insert into Salaryes(SalaryId,Salary,EmployeeId,DesignationId) values (8,22000,8,4)
go

-----Insert into sales table---------------
select *from sales
select * from Products
go
insert into sales  values (1,50,800,'2024-4-12','Monir')
insert into sales  values (2,30,700,'2024-4-12','Muhammd')
insert into sales  values (3,40,450,'2024-4-12','Rifat')
insert into sales  values (4,20,123,'2024-4-12','Masum')
insert into sales  values (5,80,456,'2024-4-12','Selim')
insert into sales  values (6,20,524,'2024-4-12','Momtaz')
insert into sales  values (7,30,75,'2024-4-12','Takia')
insert into sales  values (8,20,456,'2024-4-12','Jamal')
Go

------Insert into Shipping Complete-------------
select *from ShippingMethod
go

Insert into ShippingMethod values(2,2,'By Delivary Man',30)
Insert into ShippingMethod values(3,3,'By Delivary Man',30)
Insert into ShippingMethod values(4,4,'By Delivary Man',30)
Insert into ShippingMethod values(5,5,'By Delivary Man',30)
Insert into ShippingMethod values(6,6,'By Delivary Man',30)
Insert into ShippingMethod values(7,7,'By Delivary Man',30)
Insert into ShippingMethod values(8,8,'By Delivary Man',30)
Go

-----------Insert into shippig Method----------------
Select *from ShipingComplete
go
Insert into ShipingComplete values (2,2,2,'2024-10-04')
Insert into ShipingComplete values (3,3,3,'2023-5-04')
Insert into ShipingComplete values (4,4,4,'2023-10-04')
Insert into ShipingComplete values (5,5,5,'2023-7-04')
Insert into ShipingComplete values (6,6,6,'2023-10-04')
go
-------------Insert into stockIn Table------------
select *from StockIn 
select *From Products
go

Insert into stockIn( StockId,ProductId,ProductName,StockDate,Quantity,Unitprice,supplierName)values (3,2,'T-Shirt','2024-3-12',520,700,'Kamal')
Insert into stockIn( StockId,ProductId,ProductName,StockDate,Quantity,Unitprice,supplierName)values (4,3,'Ardiono Uno','2024-3-12',650,200,'Rofuqul Islam')
Insert into stockIn( StockId,ProductId,ProductName,StockDate,Quantity,Unitprice,supplierName)values (4,4,'12v charger','2024-3-12',600,200,'Aslam')

------Insert into CartItem table ------------------
select *FROM CartItem
GO

Insert into CartItem values (2,2,15,2,2)
Insert into CartItem values (3,3,20,3,3)
Insert into CartItem values (4,4,30,1,20)
Insert into CartItem values (5,5,10,3,2)
go
-----------------Insert into Designation table --------------------
select *FROM Designations
GO
Insert into Designations values (1,'Marketer')
Insert into Designations values (2,'Delivery Man')
Insert into Designations values (3,'SalaesMan')
Insert into Designations values (4,'Manager')
go

/*
=======================> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE===================
-------------------------------------------------------------------------------------------------
*/

---Insert into employee table-----

Exec sp_datainsertintoemployees 9,'Rofiqul Islam','01956237859',3,'rofiqulislam1256@gmail.com','Tangail','2024-12-8'
Exec sp_datainsertintoemployees 10,'Shofiqul Islam','01312453698',1,'shofiqulislam@gamil.com','Kazipura','2024-2-12'
go

----Insert into Designation Table-------

Exec sp_insertDesignation 5,'IT Support Engneer'
Exec sp_insertDesignation 6,'Programmer' 

-----Insert into Brands table-----------
select *from Brands
go

Exec sp_insertintoBrands 6,'Tiptons'
Exec sp_insertintoBrands 7,'Walton'

go
--------Insert into Cartitem Table-----------
select *from CartItem
go

Exec sp_insertintocartitem 6,3,20,3,2
Exec sp_insertintocartitem 7,4,20,4,1

GO

--------Insert into Catagory  table----------
Select *from Catagoryes
go

Exec sp_insertintocatagoryes 7,'Toys and Games'
Exec sp_insertintocatagoryes 8,'Sports ans Fitness'

Go
------Insert into Customer table -------------------
Select *from Customers
go

Exec sp_insertintocustomer 8,'Tanvir','Ta45612','tanvirhasan1234@gmail.com','Tanvir Hasan','Shibpur','01235625896','2024-12-20'
Exec sp_insertintocustomer 9,'Arafat','AR12365','arfarsayedrahman12@gmail.com','Arafat Rahman','GoforGoan','01325639685','2024-12-10'
Exec sp_insertintocustomer 10,'Rahim','Ra75859','rahimbadsha1135@gamil.com','Rahim Badsha','Jamalpur','01452638596','2021-3-4'

Go

/*
===	SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER ========
=================================================================================================
*/

----Insert Data Though store proc with output perametar in stockIn Table For show last stockIn --

select *from StockIn
select *from Products
go

Declare @laststockin int 
Exec sp_stockinoutputperam 7,7,'Car Washer','2024-5-12',50,69,'Tomal',@laststockin output  
select @laststockin 'last Numver'
go

-------------SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE--------------------------

---Insert Data in products Table using  sequence---------

select *from Products
select *from Catagoryes

go
Insert into Products values (Next value for Sk_products,'Egg',1,1,38,4000)
Insert into Products values (Next value for Sk_products,'T-Shirt',2,3,850,20)
Insert into Products values (Next value for Sk_products,'Ardiono Uno',3,2,650,200)
Insert into Products values (Next value for Sk_products,'12v Charger',3,3,320,150)
Insert into Products values (Next value for Sk_products,'Washing Machine',4,5,10,20)
Insert into Products values (Next value for Sk_products,'Peste',5,5,100,150)
go

/*
===============> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE====================
=================================================================================================
*/
---SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE----------

select *from Employees
go

Exec Sp_updateDataInemployees 10,'Shofiqul Islam','Jamalpur'  
Exec Sp_updateDataInemployees 9,'Rofiqul Islam','RosulPur' 
Exec Sp_updateDataInemployees 8,'Arif Azad','Anaspara' 
Exec Sp_updateDataInemployees 7,'Sufia Kamal','Montola' 
Exec Sp_updateDataInemployees 6,'Nafisa Kamal','Tomaltola' 

Go
----------------SUB SECTION => 3.1 : DELETE DATA THROUGH STORED PROCEDURE-------------

Exec sp_deleteFromReview 11
go

/*
=============SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR============
*/
/*
select *from Customers
go

Alter proc sp_withtrycatch @customerid int ,---
                            @CustomerName varchar(70) ,
							@password varchar(7) ,
							@email varchar (70),
							@fullname varchar (100) ,
							@add varchar(70) ,
							@phone varchar(11),
							@resistation datetime 
as
begin
Begin try
declare @pass varchar(7)
 set @password =@pass
if @pass = '123'
begin
Insert into Customers(CustomerID,CustomerName,Password,Email,FullName,Address,PhoneNumber,RagistationDate) values (@customerid, @CustomerName ,@pass,@email,@fullname,@add,@phone,@resistation)
end
end try

Begin catch

print 'Password Wrong'

End Catch

End

exec sp_withtrycatch 11,'Morsed','MMM12345','morsedmia123@gamil.com','Morsed Mia','Jamalpur','01912377380','2024-2-12' 
go
*/

exec sp_raisError --It is working
go

/*
================> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW=======================
===========================================================================================
*/

-------------Insert data by a view----------------

select *from V_employeelist
go
Insert into V_employeelist (EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate) values (11,'Joe Biden','01252639685',2,'joemental1235@gamil.com','Washington Dc','2024-2-12')

Insert into V_employeelist (EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate) values (12,'Michel Luma','01236526554',2,'micheelluma@gamil.com','New Jersey ','2023-2-12')

Insert into V_employeelist (EmployeeID,EmployeeName,PhoneNumber,DesignationId,Email,Address,JoinDate) values (13,'Wareen  Buffet','01352638596',2,'warenbuffet1425@gamil.com','Washington Dc','2023-2-12')
Go

------------Update data though view-------------------
update  V_employeelist
set designationId =2
where employeeid=13
go

----------Delete data throgh view------------------

delete from V_employeelist
where employeeid=13
go


/*
=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
*/

-------------Retreive data from a Sclar Fuction----------------------

 Select dbo.fn_priceCalculate(850,10,0.00) 'Total Price'
 Select dbo.fn_priceCalculate(750,12,0.15) 'Total Price'
 Select dbo.fn_priceCalculate(250,10,0.10) 'Total Price'
 Select dbo.fn_priceCalculate(120,10,0.00) 'Total Price'

 ------------Retreive data from a Table Valued Fuction-----------------------
 
 select * from Orders
 go

 select dbo.fn_tablevaluedfromOrder (2020,10) as 'total sale'
 select dbo.fn_tablevaluedfromOrder (2024,3) as 'total sale'
 select dbo.fn_tablevaluedfromOrder (2023,2) as 'total sale'
 select dbo.fn_tablevaluedfromOrder (2024,3) as 'total sale'
 Go
 ------------------Retreive data from a Multistatement Table valued Function ----------
 select *from Orders
 go

select * from fn_multistatementTableValueOrders (2020,10)
select * from fn_multistatementTableValueOrders (2024,3)
select * from fn_multistatementTableValueOrders (2023,2)
select * from fn_multistatementTableValueOrders (2024,3)
Go

/*
=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
============================================================================================
*/
-----Test trigger on Salaryes Table--------

select *from Salaryes---for/after trigger on this table
go

delete from Salaryes where SalaryId=1---can not delete from this table for tr_forsalary
go

----------Another One for Insert trigger----------------
/*
when a product comes returns then it will automatically add in stockin table
*/


Insert into Returns values (5,4,6,5,'Broken','2021-2-12',5)
Insert into Returns values (6,4,6,2,'Scrach','2022-2-12',10)
Insert into Returns values (7,4,7,2,'Scrach','2022-2-12',10)
go

/*
================================> SECTION 07: QUERY====================================
*/

---SUB SECTION => 7.01 : SELECT FROM TABLE----
Select *from Brands
go
select *from CartItem
go

-----SUB SECTION => 7.02 : SELECT FROM VIEW----
 Select *from V_employeelist
 go

Select *from V_showProductwithCatagoryName
go

/*
============SUB SECTION => 7.03 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE=====
*/
----Inner join between products and catagory table  with where Cluase----------
select *from Products
select *from Catagoryes
go

Select productId ,ProductName,CatagoryName,Price,quantityinstock
from Products p
inner join Catagoryes c
On p.CatagoryId=c.CategoryId
Where p.CatagoryId=c.CategoryId
Order by Productid ASC 

/*
========SUB SECTION => 7.04 : INNER JOIN WITH GROUP BY CLAUSE==============
*/
---Inner join  between Customer and orders table----
select *from Customers
select *from Orders
go

Select count(C.CustomerID) 'Customer Id',CustomerName,Orderid,quantity,TotalPrice 
from Customers c
Inner Join Orders O
On c.CustomerID=o.CustomerId
group by c.CustomerID,CustomerName,Orderid,quantity,TotalPrice 
go

/*
                         SUB SECTION => 7.05 : OUTER JOIN
		-- left outer join between Employee and Designation table----
============================================================================================
*/
Select *from Designations
select *from Employees

select employeeid,employeename, phoneNumber,joindate
from Employees e
left outer join  Designations d
on e.EmployeeID =d.DesignationId
go

/*
                         SUB SECTION => 7.06 : CROSS JOIN
	       -- Cross join between designation and Employee table---
============================================================================================
*/
select *from Designations
select *from Employees

select employeeid,employeename, phoneNumber,joindate
from Employees e
cross join  Designations d
go

/*
                               SUB SECTION => 7.07 : TOP CLAUSE WITH TIES
-------------------------------Top clause with ties in products table----------------------
============================================================================================
*/
select *from  Products
go

Select top 10 with ties  ProductId,ProductName,price ,QuantityInStock from Products
order by ProductId ASC
go

/*
-----------------------------SUB SECTION => 7.08 : DISTINCT---------------------------------
============================================================================================
*/
---DISTINCT USE FOR REMOVE DUPLICATE ROW FROM A TABLE IN A QUARY
select *from Products
go

Select distinct productid,ProductName,price
from Products
go

/*
-------------SUB SECTION => 7.09 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
============================================================================================
*/
select *from Employees
go

select  *from Employees
where DesignationId =1
and JoinDate between '2012-1-19' and '2020-2-16'
go

/*
-----------------------------SUB SECTION => 7.11 : OFFSET FETCH----------------------------
============================================================================================
*/
---It is used in how much row have to avoid form first and how much data have to retrive form the next
select * from Customers
go

select *from Customers
order by CustomerID
offset 3 rows
fetch next 5 rows only
go

/*
-------------------------SUB SECTION => 7.12 : UNION---------------------------------------
============================================================================================
*/
---Unioun on products table :

Select *from Employees
where DesignationId in ('1','2')
 union
select *from Employees
where DesignationId in ('3','4')
go

/*
-----------------------SUB SECTION => 7.13 : EXCEPT INTERSECT-------------------------------
============================================================================================
*/

---Except 
select *from Customers
except 
select *from customers
where address='jamalpur'
go

--INTERSECT
Select *from Customers
intersect
select *from Customers
where address ='jamalpur'
go

/*
-------------------	SUB SECTION => 7.14 : AGGREGATE FUNCTIONS-------------------------------
============================================================================================
*/
Select *from sales
go

Select  COUNT(*) 'Total sale',
        SUM(quantity)' Total quantity',
		AVG(quantity)'Avarage Stock'
from sales

/*
------SUB SECTION => 7.15 : AGGREGATE FUNCTIONS WITH GROUP BY AND HAVING CLAUSE ---------
============================================================================================
*/
select *from Orders
go
select BrandId, CustomerId,count(Quantity)'Total quantity' from orders
Group by BrandId

/*
------------------SUB SECTION => 7.16 : IF ELSE & PRINT-------------------------------------
============================================================================================
*/

---If -else statement
Declare @totalmark int=800

If @totalmark >=900
Begin 
 Print'Congratulation'
 Print'You are Eligble for full SchoolarShip'
End
Else If @totalmark >=800
 Begin
  Print'Congratulation'
  Print'You are Eligble for 50% Schoolarship'
End
Else
 Begin 
  Print'Sorry'
  print'You are not Eligble for any SchoolarShip'
 End
 go
/*
 -------------------------SUB SECTION => 7.18 : SUB-QUERIES---------------------------------
 ===========================================================================================
*/
select *from Products
go

 SELECT ProductName, Price,QuantityInStock
FROM 
   Products
WHERE 
    ProductId IN (SELECT ProductId FROM Products WHERE CatagoryId = 1)

/*
-------------------SUB SECTION => 7.18 : EXISTS---------------------------------------------
============================================================================================
*/
select *from Customers
Select *from Orders
go

SELECT 
   o.Orderid,
   o.OrderDate,
   o.PaymentMethod
FROM 
    Orders o
WHERE 
    EXISTS (SELECT 1 
            FROM Customers c
            WHERE c.CustomerID = o.CustomerId );

/*
----------------------------SUB SECTION => 7.19 : BUILT IN FUNCTION------------------------
============================================================================================
*/
---Get Current data and time
select GETDATE()
go

--Get string size count
select *from Products
go

SELECT ProductId, LEN(ProductName) 'Name Length' FROM Products
GO

/*
-----------------------SUB SECTION => 7.20 : WHILE loop-------------------------------------
============================================================================================
*/

Declare @Num int
set @Num=10
 
while @Num>0
     Begin 
	  print @num
	  set @Num=@Num-1
	 End
Go

/*
-------------------------------SUB SECTION => 7.21 : TRY CATCH------------------------------
============================================================================================
*/

select *from Employees
select *from Salaryes
go
----At first make a view 
Create view ViewForTryCatch
as
select e.EmployeeID ,Salary,s.DesignationId,e.employeeName from Employees e
inner join Salaryes s
On e.EmployeeID= s.EmployeeId
go

drop view ViewForTryCatch
go

Select *from ViewForTryCatch
go

---Now apply try catch on this view
---this view is not nassesary here 
---this is only for try catch example

BEGIN TRY
    DELETE FROM Salaryes;
END TRY
BEGIN CATCH
    DECLARE @error NVARCHAR(200);
    SET @error = 'Error ' + CAST(ERROR_NUMBER() AS NVARCHAR(10)) + ': ' + ERROR_MESSAGE();
    RAISERROR (@error, 16, 1);
END CATCH

 /*
 --------------------------------SUB SECTION => 7.22 : GOTO--------------------------------
 ==========================================================================================
 */

 Declare @Mark int =80
 if
  @Mark>=50
    Goto pass
 if 
  @Mark<=50
    Goto fail
 Pass:
  print 'Congratulation'
  print 'You are pass'
  return
 Fail:
  print'Sorry'
  print'You are Fail'
  return
go

/*
---------------------------SUB SECTION => 7.23 : sp_helptext--------------------------------
============================================================================================
*/
exec sp_helptext sp_datainsertintoemployees
go



















