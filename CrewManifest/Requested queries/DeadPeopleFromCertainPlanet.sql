--again on description
select c.FirstName, p.PlanetName
from CrewMember as c
inner join Planet as p on c.BirthPlanetID=p.PlanetID
where p.PlanetName='Earth';
