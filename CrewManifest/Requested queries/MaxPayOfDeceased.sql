select max(c.Salary) as 'Highest Salary of deceased crewmember'
from CrewMember as c
where c.DeceasedID is not null;