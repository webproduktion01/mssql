--Query spec says only name, not full name
declare @beginning datetime =  '2122-06-05 00:00:00';
select c.FirstName, d.DeathDate
from CrewMember as c
inner join Death as d on c.DeceasedID=d.DeathID
where d.DeathDate between DATEADD(Day,4,@beginning) and DATEADD(Day,8,@beginning); 