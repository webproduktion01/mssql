CREATE PROCEDURE [dbo].[NosBetweenDates]
	@dateone datetime,
	@datetwo datetime
AS
	select c.FirstName, d.DeathDate
	from CrewMember as c
	inner join Death as d on c.DeceasedID=d.DeathID
	where d.DeathDate between @dateone and @datetwo;
RETURN 0
