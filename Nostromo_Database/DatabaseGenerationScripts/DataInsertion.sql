begin transaction
declare @todaysdate datetime = '2122-06-05 00:00:00';
--Cleaning first, have delete cascade on all foreign keys for testing purposes
delete from Assignment;
delete from CrewMember;
delete from Department;
delete from rank;
delete from Planet;
delete from Species;
delete from Death;
delete from DeathCause;
--Ranks
--Identity is set on all tables
insert into rank values ('Captain','Generally the commander of a ship');
insert into rank values ('Executive Officer','Generally responsible for running an organisation');
insert into rank values ('Warrant Officer','A Officer that is either a technical leader or specialists of somekind');
insert into rank values ('Lieutenant', 'Second-in-command officer rank');
insert into rank values ('Science Officer','General description for a scientist aboard a spacevessel');
insert into rank values ('Navigator','Navigational specialist, oversees trajectory calculations, etc');
insert into rank values ('Chief Engineer','Engineer that oversees and is responsible for other engineers and all equipment aboard a ship');
insert into rank values ('Engineering Technician','Specialized engineer');
insert into rank values ('No rank','Non-ranked personell');
insert into rank values ('Stowaway','Unwanted passenger');


--Departments
insert into Department values ('Medical','Mostly where people come to die');
insert into Department values ('Navigation','Consists of mostly navigational computers and items used to interact with them');
insert into Department values ('Engineering','A department specialized in disassembly,manufacturing and repair of items');
insert into Department values ('Sleeping quarters','A place where the crew sleeps or hibernates depending on timeframe');
insert into Department values ('Science','A place where fantasy becomes reality, well not really but you get the idea');



--Planets , well there's 2 but only one is ever used as no one has ever been born on a gas giant. Atleast not that humanity knows of in this universe
insert into Planet values ('Earth','Homeworld of the human race, has one relatively large moon');
insert into Planet values ('Calpamos','A ringed gas giant with three moons');

--species, aliens and predators are unknown to the crew of Nostromos
insert into Species values('Human','A bipedal biological creature with 2 arms and a head');
insert into Species values ('Synthetic','Synthetics, also known as androids or — as some synthetics themselves prefer to be called — "artificial persons" , are biomechanical humanoids. They are essentially robots that closely emulate Humans in both appearance and actions. Synthetics once constituted a huge industry and were in widespread use throughout the galaxy, but a violent rebellion ultimately led to them being declared illegal, with virtually all extant units being destroyed in a mass recall');
insert into Species values('Cat','Quadraped carnivore that is kept as pets by humans');


--Causes of death
--making these upp randomly
insert into DeathCause values ('Murder','Death caused by other humans planned actions');
insert into DeathCause values ('Involuntary Manslaughter','Death caused by other humans unplanned actions');
insert into DeathCause values ('Old age','Humans tend to die by old age');
insert into DeathCause values ('Planned disassembly','Synthetics sometimes get scheduled for termination when their programming goes haywire');
insert into DeathCause values ('Unplanned disassembly','Whenever a synthetics memories are unrecoverable due to enviromental effects');
insert into DeathCause values ('Animal attack','Death by local or alien fauna');
insert into DeathCause values ('Disease','Death by a contracted disease');


--CrewMembers


declare @planetName as nvarchar(50)= 'Earth';

insert into CrewMember values ('Arthur','Dallas',1,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Captain'),
'2075-02-27',null,55000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Gilbert','Kane',0,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Executive Officer'),
'2083-04-20',null,90000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Ellen','Ripley',1,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Warrant Officer'),
'2092-01-07',null,30000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Ash',null,null,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Science Officer'),
'2101-01-01',null,40000,
(select Species.SpeciesID from Species where Species.SpeciesName='Synthetic'));


insert into CrewMember values ('Joan','Lambert',1,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Navigator'),
'2093-11-07',null,50000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Dennis','Parker',0,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Chief Engineer'),
'2080-02-04',null,55000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Samuel','Brett',0,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='Engineering Technician'),
'2069-07-13',null,25000,
(select Species.SpeciesID from Species where Species.SpeciesName='Human'));


insert into CrewMember values ('Jones',null,0,
(select Planet.PlanetID from Planet where PlanetName=@planetName),
(select Rank.RankID from Rank where Rank.RankName='No rank'),
'2120-01-01',null,0,
(select Species.SpeciesID from Species where Species.SpeciesName='Cat'));

--Department assignments
insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Navigation'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Arthur'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Navigation'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Gilbert'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Engineering'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Ellen'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Science'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Ash'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Engineering'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Dennis'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Engineering'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Samuel'));

insert into Assignment values (
(select Department.DepartmentID from Department where Department.DepartmentName='Navigation'),
(select CrewMember.CrewMemberID from CrewMember where CrewMember.FirstName='Joan'));


--Crewmembers deaths, ill leave ripley alive(this database's current date is somewhere before Alien 3 i think) and the cat dead
--Date of most deaths was after June 3, 2122. Could have re-watched movie and estimated exact time of death for crew members but this in an approximation
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Animal attack'),'disabled by alien and dragged to alien den where he was killed by a alien chestburster',dateadd(DAY,7,@todaysdate));
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Animal attack'),'Attacked and impregnated by a alien facehugger and later died when the alien chestburster emerged',dateadd(DAY,1,@todaysdate));
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Unplanned disassembly'),'Destroyed by virus which wiped a shuttles mainframe memory', '2159-01-01 00:00:00');
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Animal attack'),'killed by Alien whilst gathering oxygen tanks',dateadd(DAY,14,@todaysdate));
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Animal attack'),'killed by Alien in crews first encounter with adult alien',dateadd(DAY,6,@todaysdate));
insert into Death values ((select DeathCause.DeathCauseID from DeathCause where DeathCause.DeathCause ='Old age'),'Died by old age, cats only live about 20 years. Hypersleep makes him a bit older than he should be though',dateadd(YEAR,57,@todaysdate));

update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%alien den%')
where CrewMember.LastName = 'Dallas';
update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%facehugger%')
where CrewMember.LastName = 'Kane';
update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%virus%')
where CrewMember.FirstName = 'Ash';
update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%oxygen tanks%')
where CrewMember.LastName = 'Parker';
update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%oxygen tanks%')
where CrewMember.LastName = 'Lambert';
update CrewMember set DeceasedID = (select Death.DeathID from Death where Death.DeathDescription like '%adult%')
where CrewMember.LastName = 'Brett';
update CrewMember set DeceasedID = (
select Death.DeathID from Death 
inner join DeathCause on Death.DeathCauseID=DeathCause.DeathCauseID
where DeathCause.DeathCause ='Old age')
where CrewMember.FirstName = 'Jones';
commit;


 







