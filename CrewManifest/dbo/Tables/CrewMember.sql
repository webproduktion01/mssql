CREATE TABLE [dbo].[CrewMember] (
    [CrewMemberID]  INT           IDENTITY(1,1) NOT NULL ,
    [FirstName]     NVARCHAR (50) NOT NULL,
    [LastName]      NVARCHAR (50) NULL,
    [Gender]        BIT           NULL,
    [BirthPlanetID] INT           NOT NULL,
    [RankID]        INT           NOT NULL,
    [Age]           INT           NOT NULL,
    [Deceased]      INT           NULL,
    [Salary]        MONEY         NULL,
    [SpeciesID]     INT           NOT NULL,
    CONSTRAINT [PK_CrewMember] PRIMARY KEY CLUSTERED ([CrewMemberID] ASC),
    FOREIGN KEY ([SpeciesID]) REFERENCES [dbo].[Species] ([SpeciesID]),
    CONSTRAINT [FK_CrewMember_Death] FOREIGN KEY ([Deceased]) REFERENCES [dbo].[Death] ([DeathID]),
    CONSTRAINT [FK_CrewMember_Planet] FOREIGN KEY ([BirthPlanetID]) REFERENCES [dbo].[Planet] ([PlanetID]),
    CONSTRAINT [FK_CrewMember_Rank] FOREIGN KEY ([RankID]) REFERENCES [dbo].[Rank] ([RankID])
);

