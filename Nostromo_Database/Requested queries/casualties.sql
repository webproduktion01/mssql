
--Crewmembers can be assigned to more than one department
select c.FirstName +' ' +case when c.LastName is null then ''
else c.LastName end as 'Full Name', 
dp.DepartmentName as 'Department', 
p.PlanetName as 'Homeplanet', 
case
when c.Gender = 0 then 'Male'
when c.Gender = 1 then 'Female'
else 'None' end as 'Gender',
sp.SpeciesName as 'Species',
r.RankName as 'Rank'
from CrewMember as c
inner join Assignment as a on c.CrewMemberID = a.CrewMemberID
inner join Department as dp on a.DepartmentID = dp.DepartmentID
inner join Planet as p on c.BirthPlanetID = p.PlanetID
inner join Species as sp on c.SpeciesID = sp.SpeciesID
inner join Rank as r on c.RankID = r.RankID;




	