create database test
go
use test
go
create table product
(
id int not null identity,
ProductName varchar (30) not null,
Unitprice money not null,
Quantity int not null,
Discount float not null,
SalesDate datetime not null,
)
go
--insert data
insert into product(ProductName,Unitprice,Quantity,Discount,SalesDate) values
('Potato chips',10,100,0.10,'2024-1-11'),
('Ring chips',15,150,0.05,'2024-1-11'),
('Aloz chips',25,50,0.10,'2023-11-11'),
('Chicken Naget',120,30,0.20,'2023-2-12'),
('Beef',700,5,0.05,'2024-1-11')
GO
SELECT*from product
go
--create UDF
drop function fn_totalsale
go
create function fn_totalsale (@year int ,@month int)
Returns money
as
Begin
 declare @totalsale money 
 select @totalsale=unitprice*Quantity*(1-Discount) from product
 where year(salesdate)=@year and MONTH(salesdate)=@month
 return @totalsale
end
go 
--test it
select dbo.fn_totalsale (2024,1) as 'total sale'

--test
select dbo.fn_totalsale
go
--test from sir
CREATE FUNCTION fnCalNetAmount(@year INT,@month INT)
RETURNS MONEY
AS
BEGIN
		DECLARE @totalSales MONEY
		SELECT @totalSales= unitPrice*quantity*(1-Discount) FROM product
		WHERE YEAR(SalesDate)=@year AND MONTH(SalesDate)=@month
		RETURN @totalSales
END
GO
--test
select dbo.fnCalNetAmount (2024,1)
go
---table function
--return table data
create function fn_tabletotalsale ( @year int ,@month int )
returns table
as
return
(
 select
 sum (unitprice*quantity) as 'Total sales',
 sum (unitprice*quantity*discount) as 'Total Discount',
 sum (unitprice *quantity*(1-discount))as 'Net sale'
 from product 
 )
 go
 --test
 select *from fn_tabletotalsale (2024,1)
 go

 select *from product
 go


