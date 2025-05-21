select * from EmployeeTable
select * from ProjectTable

---get employee firstname,emailid, akill who are mapped to a project.

select e.FirstName,e.EmailId,e.Skill,p.ProjectName from EmployeeTable e
inner join
ProjectTable p on e.ProjectId=p.ProjectId


---get all projects and only the matching employee from the employee table

select p.projectName,p.ClientName ,e.FirstName,e.EmailId from ProjectTable p
left join EmployeeTable e
on p.ProjectId=e.ProjectId

---get all employee and only the matching projects from the employee table


insert into EmployeeTable values(104,'05/05/2020','Vijay','M','vijay@g.com',32,50000,null,'Oracle')


select e.FirstName,e.EmailId ,coalesce(p.projectName,'N/A'),coalesce(p.ClientName,'N/A') from ProjectTable p
right join EmployeeTable e
on p.ProjectId=e.ProjectId

select * from EmployeeTable full outer join ProjectTable on EmployeeTable.ProjectId=ProjectTable.ProjectId

select * from EmployeeTable cross join ProjectTable

---get employee employeeid, firstname,email id for those working in projects eshop and e banking

select EmployeeId,FirstName,EmailId from EmployeeTable where ProjectId in
(select projectId from ProjectTable where ProjectName='E-Shop' or ProjectName='E-Banking')

insert into ProjectTable values(6,'E-Learning',130,'TutorialsTeacher','Hyd')

update EmployeeTable set ProjectId=6 where EmployeeId=104

select EmployeeId,FirstName,EmailId from EmployeeTable where ProjectId in
(select projectId from ProjectTable where ProjectDuration<150)

select ProjectName, WorkLocation from ProjectTable
where ProjectId in 
(
    select ProjectId from EmployeeTable where EmployeeId = 101
)

insert into EmployeeTable values(105,'05/10/2020','Virat','K','virat@g.com',35,50000,6,'Oracle')

select p.ProjectName, count(e.EmployeeId) as EmployeeCount from EmployeeTable e
inner join ProjectTable p on e.ProjectId = p.ProjectId
group by p.ProjectName;

select * from sys.objects where type_desc='User_Table'

select * from sys.objects where type_desc='View'

select * from sys.dm_exec_connections

go
create view View_EmployeeTable 
as
select FirstName,EmailId from EmployeeTable

select * from View_EmployeeTable



go
create view View_EmployeeProjectDetails
as
select e.FirstName,e.EmailId,e.Skill,p.ProjectName from EmployeeTable e
inner join
ProjectTable p on e.ProjectId=p.ProjectId


---get view definition

exec sp_helptext 'View_EmployeeProjectDetails'

exec sp_help 'EmployeeTable'

--reneame view
exec sp_rename 'View_EmployeeProjectDetails','View_EmployeeProject'

select * from View_EmployeeProjectDetails

select * from View_EmployeeProject