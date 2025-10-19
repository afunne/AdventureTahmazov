USE AdventureWorksDW2019;

-- checking stuff
select * from DimEmployee;
select * from DimDepartmentGroupw;

-- View serveris
-- Selleks, et saada soovitud tulemus, me peaksime ühendama kaks tabelit omavahel
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey;

