CREATE TABLE [dbo].[Species] (
    [SpeciesID]          INT            IDENTITY(1,1) NOT NULL,
    [SpeciesName]        NVARCHAR (50)  NOT NULL,
    [SpeciesDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED ([SpeciesID] ASC)
);

