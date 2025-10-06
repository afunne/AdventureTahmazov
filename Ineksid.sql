-- Ineksid serveris
use AdventureWorksDW2019;

select * from DimEmployee

Select * from DimEmployee where BaseRate > 10 and BaseRate < 20;

create index IX_DimEmployee_Salary
on DimEmployee (BaseRate ASC)

SELECT * FROM DimEmployee
WITH (INDEX(IX_DimEmployee_Salary)) -- forumist stackoverflow

exec sp_helptext DimEmployee; -- see ei tööta :<