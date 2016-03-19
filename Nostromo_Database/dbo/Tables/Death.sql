CREATE TABLE [dbo].[Death] (
    [DeathID]          INT            IDENTITY (1, 1) NOT NULL,
    [DeathCauseID]     INT            NULL,
    [DeathDescription] NVARCHAR (MAX) NULL,
    [DeathDate]        DATETIME       NOT NULL,
    CONSTRAINT [PK_Death] PRIMARY KEY CLUSTERED ([DeathID] ASC),
    CONSTRAINT [FK_Death_DeathCause] FOREIGN KEY ([DeathCauseID]) REFERENCES [dbo].[DeathCause] ([DeathCauseID]) ON DELETE CASCADE
);

