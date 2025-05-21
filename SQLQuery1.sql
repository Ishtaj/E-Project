CREATE DATABASE ProjectDb

use ProjectDb

/*Project Table
	Employee Table
*/

create table ProjectTable
(
ProjectId int primary key,
ProjectName varchar(100),
ProjectDuration int,
ClientName varchar(100),
WorkLocation varchar(100)
)

insert into ProjectTable values (1,'E-Shop',70,'Flipkart','Bangalore')
insert into ProjectTable values (2,'E-Bill',50,'Ascention','Bangalore')
insert into ProjectTable values (3,'E-Banking',70,'HDFC','Chennai')
insert into ProjectTable values (4,'E-HealthCare',100,'Apollp','Delhi')
insert into ProjectTable values (5,'E-Learning',150,'MSDN','Pune')

---get all project available either in chennai, banagalore
select * from ProjectTable where WorkLocation='Chennai' or WorkLocation='Bangalore'
select * from ProjectTable where WorkLocation in('Chennai','Bangalore')

---get total duration by location
select sum(ProjectDuration), WorkLocation from ProjectTable group by WorkLocation

---1.It can fetch only columns present in groupbyclass or columns which contain aggregate func
select ProjectName, WorkLocation from ProjectTable group by WorkLocation,ProjectName

---where- if condition doesnot contain aggregate function use where
---having- if condition contain aggregate function use having
select ProjectName,WorkLocation from ProjectTable where count(ProjectName)>1 group by WorkLocation  

select ProjectName,WorkLocation from ProjectTable group by WorkLocation having count(ProjectName)>1 

create table EmployeeTable
(
EmployeeId int primary key,
JoiningDate date,
FirstName varchar(100),
LastName varchar(100) default 'N/A',
EmailId varchar(100) unique,
Age int check(age>20 and age<40),
Salary money/*data type--can store double*/,
ProjectId int foreign key references ProjectTable(ProjectId)
)

/* Skill --- add new column or delete column ----- Alter */

alter table EmployeeTable add Skill varchar(100)
select * from EmployeeTable

insert into Employeetable values(101,'01/15/2022','Santhosh','H B','san@g.com',30,40000,1,'Dotnet')
insert into Employeetable values(102,'02/15/2022','Sony',default,'sony@g.com',32,30000,2,'BI')
insert into Employeetable values(103,'03/20/2022','Adam','George','adam@g.com',32,50000,2,'Oracle')

---update
update EmployeeTable set ProjectId=3 where EmployeeId=103
select * from EmployeeTable

----get Employee name and email sal>25000 and sal<50000

select (FirstName+LastName) 'Name',EmailId from EmployeeTable where  Salary>25000 and Salary<50000

