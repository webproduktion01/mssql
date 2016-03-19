CREATE TABLE [dbo].[CrewMember] (
    [CrewMemberID]  INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]     NVARCHAR (50) NOT NULL,
    [LastName]      NVARCHAR (50) NULL,
    [Gender]        BIT           NULL,
    [BirthPlanetID] INT           NOT NULL,
    [RankID]        INT           NOT NULL,
    [BirthDate]     DATE          NOT NULL,
    [DeceasedID]    INT           NULL,
    [Salary]        MONEY         NULL,
    [SpeciesID]     INT           NOT NULL,
    CONSTRAINT [PK_CrewMember] PRIMARY KEY CLUSTERED ([CrewMemberID] ASC),
    FOREIGN KEY ([SpeciesID]) REFERENCES [dbo].[Species] ([SpeciesID]) ON DELETE CASCADE,
    CONSTRAINT [FK_CrewMember_Death] FOREIGN KEY ([DeceasedID]) REFERENCES [dbo].[Death] ([DeathID]) ON DELETE CASCADE,
    CONSTRAINT [FK_CrewMember_Planet] FOREIGN KEY ([BirthPlanetID]) REFERENCES [dbo].[Planet] ([PlanetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_CrewMember_Rank] FOREIGN KEY ([RankID]) REFERENCES [dbo].[Rank] ([RankID]) ON DELETE CASCADE
);

