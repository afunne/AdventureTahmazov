-- funktsioonid
use AdventureWorksDW2019;
select * from DimEmployee

create Function fn_ILTVF_GetEmployees()

Returns table
as
Return (Select EmployeeKey, FirstName, LastName, cast(BirthDate as Date) as DOB
From DimEmployee);

select * from fn_ILTVF_GetEmployees();

insert into DimEmployee(EmployeeKey, FirstName, BirthDate, Gender, DepartmentName)
values (297, 'Sam', '1977-09-10', 'M', 'Quality Assurance');

Create function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee Where EmployeeKey = @Id)
end;

select * from fn_GetEmployeeNameById();

Alter Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
With encryption
as
begin
return (select FirstName from DimEmployee where EmployeeKey = @Id)
end;