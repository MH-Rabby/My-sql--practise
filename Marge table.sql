USE pntledu
GO
CREATE TABLE Warehouse
(
locations VARCHAR(40) NOT NULL,
ProductName VARCHAR(40) NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL
)
GO

CREATE TABLE Shops
(
Locations VARCHAR(40) NOT NULL,
ProductId INT NOT NULL,
ProductName VARCHAR(40) NOT NULL,
Quantity INT NOT NULL,
Comments varchar(200)  NULL,
Updatedate DATETIME NULL
)
GO
--DATA INSERT
SELECT *FROM Warehouse
GO
INSERT INTO Warehouse VALUES ('Kalihati','Goldleaf',10,1000)
INSERT INTO Warehouse VALUES ('Kalihati','Lucky Strick',12,1000)
INSERT INTO Warehouse VALUES ('Kalihati','Camel Switch',14,1000)
INSERT INTO Warehouse VALUES ('Kalihati','Malboro',16,1000)
INSERT INTO Warehouse VALUES ('Kalihati','Black',18,1000)
INSERT INTO Warehouse VALUES ('Kalihati','Dunehill',20,1000)
GO

SELECT *FROM Shops
GO
INSERT INTO Shops VALUES ('Dhanmondi 32',10,'Goldleaf',120,null,null)
INSERT INTO Shops VALUES ('Shukrabad ',12,'Lucky Strick',100,null,null)
INSERT INTO Shops VALUES ('Dhanmondi 27',14,'Camel Switch',90,null,null)
INSERT INTO Shops VALUES ('Khilkhet',16,'Malboro',80,null,null)
INSERT INTO Shops VALUES ('Kolabagan',18,'Black',30,null,null)
INSERT INTO Shops VALUES ('New Market ',20,'Dunehill',82,null,null)
INSERT INTO Shops VALUES ('Gigatola ',22,'Mond',40,null,null)
INSERT INTO Shops VALUES ('Kuril ',24,'Darby',50,null,null)
Go

--Marge
MERGE Shops as tgt
USING Warehouse as src
ON tgt.ProductID = src.ProductID --MATCHING DATA
WHEN MATCHED
THEN 
UPDATE SET Updatedate=Getdate(),Comments='This product is available in both side.'
When Not MATCHED
THEN
INSERT (LocationS,Productid,productName,Updatedate,comments) VALUES
(src.locations,src.productId,src.productName,Getdate(),'Not avilable in shop,delevary it from warehouse')
 
WHEN NOT MATCHED BY source
Then
UPDATE SET Updatedate=GETDATE(),Comments='Last pack in shop ,stock it soon';
go
 
Select *FROM Warehouse
SELECT *FROM Shops
go

