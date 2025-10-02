-- funktsioonid
use AdventureWorksDW2019;
select * from DimEmployee

create Function fn_ILTVF_GetEmployees()

Returns table
as
Return (Select EmployeeKey, FirstName, LastName, cast(BirthDate as Date) as DOB
From DimEmployee);

select * from fn_ILTVF_GetEmployees()