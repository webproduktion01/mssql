select c.FirstName +' '+c.LastName as 'Name', dc.DeathCause as 'Cause of Death',d.DeathDate as 'Date'
from CrewMember as c
inner join Death as d on d.DeathID = c.DeceasedID
inner join DeathCause dc on d.DeathCauseID = dc.DeathCausedID;