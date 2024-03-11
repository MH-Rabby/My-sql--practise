use pntl_ripo
go

select *from Departments
select *from employee
go

select isnull( Departmentid,'6'),sum(salary)as 'Total' 
from employee
Group by  Rollup (DepartmentId)
go

alter table employee
drop column departmentID
GO

alter table employee
drop constraint FK__employee__Depart__3A81B327
go

alter table employee
add DepartmentName varchar (40) null default 'null'
go
select *from employee
go


update employee  
set DepartmentName='It' WHERE DEPARTMENTNAME is NULL
GO

insert into employee (id,EmployeeName,Salary,DepartmentName) values ( 4,'Sifat',1200,'Admin')
Insert into employee(id,EmployeeName,Salary,DepartmentName) values (5,'Arif',15000,'Complayince')
go

select coalesce (Departmentname,'Alldept.') 'department',sum(salary) 'total'
from employee
group by Rollup (DepartmentName)
go

select id,EmployeeName,DepartmentName 
from employee
where Salary=(select max (salary) from employee)
go


SELECT id, employeeName, salary,DepartmentName
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);
