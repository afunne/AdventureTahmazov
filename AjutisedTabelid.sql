-- teine failist: Ajutised tabelid
use AdventureWorksDW2019;

Create Table #PersonDetails(Id int, FirstName nvarchar(20))

Insert into #PersonDetails values(1, 'Mike');
Insert into #PersonDetails values(2, 'John');
Insert into #PersonDetails values(3, 'Todd');

Select * from #PersonDetails

