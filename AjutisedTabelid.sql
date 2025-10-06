-- teine failist: Ajutised tabelid
use AdventureWorksDW2019;

Create Table #PersonDetails(Id int, FirstName nvarchar(20))

Insert into #PersonDetails values(1, 'Mike');
Insert into #PersonDetails values(2, 'John');
Insert into #PersonDetails values(3, 'Todd');

Select * from #PersonDetails;

select name from tempdb..sysobjects
where name like '#PersonDetails%';

DROP TABLE #PersonDetails;

Create Procedure spCreateLocalTempTable
as
begin
Create Table #PersonDetails(Id int, FirstName nvarchar(20))
Insert into #PersonDetails values(1, 'Mike')
Insert into #PersonDetails values(2, 'John')
Insert into #PersonDetails values(3, 'Todd')

select * from #PersonDetails
end;

spCreateLocalTempTable;

create table ##EmployeeDetails(id int, FirstName nvarchar(20));

/*
Differences between local and global temporary tables:
1. Local temporary tables have one # sign, but global ones have two.
2. SQL Server adds random numbers to the name of a local temporary table, but not to a global one.
3. Local tables are only visible in the session that created them, but global tables are visible in all sessions.
4. Local temporary tables are automatically deleted when the session that created them is closed, but global temporary tables are only terminated after the last connection is closed.
*\
