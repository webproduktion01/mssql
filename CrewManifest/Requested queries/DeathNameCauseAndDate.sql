select c.FirstName +' '+
case when c.LastName is null then ''
else c.LastName end as 'Name', dc.DeathCause as 'Cause of Death',d.DeathDate as 'Date'
from CrewMember as c
inner join Death as d on d.DeathID = c.DeceasedID
inner join DeathCause dc on d.DeathCauseID = dc.DeathCauseID;