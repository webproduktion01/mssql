select dc.DeathCause as 'Causes of death', count(c.DeceasedID) as 'Quantity'
from CrewMember as c
inner join Death as d on c.DeceasedID=d.DeathID
inner join DeathCause as dc on d.DeathCauseID=dc.DeathCauseID
group by dc.DeathCause;