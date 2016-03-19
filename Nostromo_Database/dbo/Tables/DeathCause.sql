CREATE TABLE [dbo].[DeathCause] (
    [DeathCauseID]          INT            IDENTITY (1, 1) NOT NULL,
    [DeathCause]            NVARCHAR (50)  NOT NULL,
    [DeathCauseDescription] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_DeathCause] PRIMARY KEY CLUSTERED ([DeathCauseID] ASC)
);

