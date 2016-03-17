CREATE TABLE [dbo].[Planet] (
    [PlanetID]          INT            IDENTITY(1,1) NOT NULL,
    [PlanetName]        NVARCHAR (50)  NOT NULL,
    [PlanetDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Planet] PRIMARY KEY CLUSTERED ([PlanetID] ASC)
);

