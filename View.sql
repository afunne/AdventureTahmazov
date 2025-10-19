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

-- View, mis tagastab ainult Corporate osakonna töötajad
CREATE VIEW vwCorporateDepartment_Employees
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
WHERE DimDepartmentGroup.DepartmentGroupName = 'Corporate';

SELECT * FROM vwCorporateDepartment_Employees

-- View, kus ei ole BaseRate veergu
CREATE VIEW vwEmployeesNonConfData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey;

SELECT * FROM vwEmployeesNonConfData

-- View, mis tagastab summeeritud andmed töötajate koondarvest.
CREATE VIEW vwEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(DepartmentGroupKey) AS TotalEmployees
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
GROUP BY DepartmentName;

SELECT * FROM vWEmployeesCountByDepartment