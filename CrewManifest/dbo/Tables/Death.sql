CREATE TABLE [dbo].[Death] (
    [DeathID]          INT            NOT NULL,
    [DeathCause]       NVARCHAR (50)  NULL,
    [DeathDescription] NVARCHAR (MAX) NULL,
    [DeathDate]        DATETIME       NOT NULL,
    CONSTRAINT [PK_Death] PRIMARY KEY CLUSTERED ([DeathID] ASC)
);

