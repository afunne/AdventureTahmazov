-- Ineksid serveris

use AdventureWorksDW2019;

select * from DimEmployee

/*
Indekseid kasutatakse päringute tegemisel, mis annavad meile kiiresti andmeid.
Indekseid luuakse tabelites ja vaadetes.
Indeks tabelis või vaates on samasugune raamatu indeksile.
*/

Select * from DimEmployee where BaseRate > 10 and BaseRate < 20;

create index IX_DimEmployee_Salary
on DimEmployee (BaseRate ASC)

SELECT * FROM DimEmployee
WITH (INDEX(IX_DimEmployee_Salary)) -- forumist stackoverflow

exec sp_helptext DimEmployee; -- see ei tööta :<

-- DROP INDEX index_name ON table_name;
DROP INDEX PK_DimEmployee_EmployeeKey ON DimEmployee;


/*Klastreeritud indeks dikteerib säilitatud andmete järjestuse tabelis
ja seda saab klastreeritud puhul olla tabeli peale ainult üks. 
Kui soovime luua teise klastreeritud indeksi Name veeru alusel,
siis andmed tuleb järjestada selle veeru
järgi ja see mõjutab järjestust teistmoodi*/

-- Klastreeritud ja mitte-klastreeritud indeksid
create clustered index IX_DimEmployee_Name
on DimEmployee(FirstName);

create clustered index IX_DimEmployee_Gender_Salary
on DimEmployee(Gender DESC, BaseRate ASC);

/*Mitte-klastreeritud indeks:
Mitte-klastreeritud indeks on analoog indeksile õpikus.
Andmed on säilitatud ühte kohta ja indeks teise kohta.
Indeksil on suunajad e pointerid andmete salvestuskohta.
Mitte-klastreeritud indeksid  on säilitatud eraldi tegelikust andmetest ja selle tulemusel saab tabel omandada rohkem,
kui ühte mitte-klastreeritud indeksit. Analoogi võiks tuua raamatuga,
kus indeksid on peatükkide järgi ja lõpus on lõpus olevate terminitega teine indeks.
*/

Create NonClustered Index IX_DimEmployee_Name
on DimEmployee(FirstName);

/*
Erinevused klastreeritud ja mitte-klastreeritud indeksi vahel:
1. Ainult üks klastreeritud indeks tabeli peale, samas saab olla rohkem, kui mitte-klastreeritud indeks
2. Klastreeritud indeks on kiirem, kui mitte-klastreeritud indeks kuna mitte-klastreeritud indeks peab tagasi viitama tabelile. Seda juhul, kui selekteeritud veerg ei ole olemas indeksis.
3. Klastreeritud indeks määratleb ära tabeliridade salvestusjärjestuse ja ei nõua kettal lisaruumi. Samas mitte-klastreeritud on salvestatud tabelist eraldi ja on vaja lisaruumi.
*/


/*
Luues unikaalse piirangu, mis loob unikaalse indeksi. Seda saab luua,
kui kasutad CREATE INDEX käsklust või siis kaudselt ning milles kasutatakse UNIQUE piirangut
Millal kumma kasuks otsustada? Unikaalse piirangu puhul oleks kasulik kasutada, kui andmete terviklikus on objektiivne.
Mõlemal juhul toimub andmete valideerimine sama moodi ja päringu optimeerimine ei erine.
*/
CREATE UNIQUE INDEX IX_tblEmployee_City
ON DimEmployee(DepartmentName)
WITH IGNORE_DUP_KEY

select * from DimEmployee

-- Indeksi plussid ja miinused
create nonclustered index IX_DimEmployee_Salary
on DimEmployee (BaseRate asc)

-- Indeksi plussid ja miinused
-- Indeksist lähtuvalt on kergem üles otsida palkasid, mis jäävad vahemikku 4000 kuni 8000 ning kasutada reaaadressi.
SELECT * FROM DimEmployee WHERE BaseRate > 5 AND BaseRate < 10

-- Kui soovid uuendada või kustutada rida, siis SQL server peab esmalt leidma rea ja indeks saab aidata seda otsingut kiirendada.
DELETE FROM DimEmployee WHERE BaseRate = 9.50
UPDATE DimEmployee SET BaseRate = 50 WHERE BaseRate = 9.25

SELECT * FROM DimEmployee

-- See välistab päringu käivitamisel ridade sorteerimise, mis oluliselt  suurendab  protsessiaega.
SELECT * FROM DimEmployee ORDER BY BaseRate

-- BaseRate veeru indeks saab aidata ka allpool olevat päringut. Seda tehakse indeksi tagurpidi skanneerimises.
SELECT * FROM DimEmployee ORDER BY BaseRate DESC

-- GROUP BY päringud saavad kasu indeksitest. Kui soovid grupeerida töötajaid sama palgaga, siis päringumootor saab kasutada BaseRate veeru indeksit
SELECT BaseRate, COUNT(BaseRate) AS Total
FROM DimEmployee
GROUP BY BaseRate