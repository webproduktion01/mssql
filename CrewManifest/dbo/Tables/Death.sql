CREATE TABLE [dbo].[Death] (
    [DeathID]          INT            IDENTITY(1,1) NOT NULL,
    [DeathCause]       NVARCHAR (50)  NULL,
    [DeathDescription] NVARCHAR (MAX) NULL,
    [DeathDate]        DATETIME       NOT NULL,
    CONSTRAINT [PK_Death] PRIMARY KEY CLUSTERED ([DeathID] ASC)
);

