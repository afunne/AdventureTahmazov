USE AdventureWorksDW2019;

-- checking stuff
select * from DimEmployee;
select * from DimDepartmentGroupw;

-- View serveris --

-- Selleks, et saada soovitud tulemus, me peaksime ühendama kaks tabelit omavahel
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey;

-- Nüüd loome view, kus kasutame JOIN-i
CREATE VIEW vwEmployeeByDepartment
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
-- Käivita
SELECT * FROM vWEmployeeByDepartment;

drop view vWEmployeeByDepartment;
