--Not told in query what data to display so i just chose the data points of interest
select r.RankName,c.Salary
from CrewMember as c
inner join Rank as r on c.RankID = r.RankID
where c.Salary>50000 and r.RankName='Captain';
