use ProjectDb
create table ProductTable
(
ProductId int,
ProductName varchar(100),
Price money,
IsAvailablity bit,/*return 0 and 1*/
CityCode int
)

exec sp_helpindex 'ProductTable'

---Clustered Index

create clustered index Index_ProductId1 on ProductTable(ProductId)

---Non Clustered Index
create nonclustered index Index_CityCode1 on ProductTable(CityCode)

exec sp_rename 'ProductTable.Index_ProductId1','Index_ProductId2'
