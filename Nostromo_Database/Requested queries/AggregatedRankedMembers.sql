select r.RankName as 'Rank' ,count(c.RankID) as 'Count'
from CrewMember as c
inner join Rank as r on c.RankID = r.RankID
group by c.RankID,r.RankName
order by r.RankName;