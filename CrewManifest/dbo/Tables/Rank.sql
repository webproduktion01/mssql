CREATE TABLE [dbo].[Rank] (
    [RankID]          INT            NOT NULL,
    [RankName]        NVARCHAR (50)  NOT NULL,
    [RankDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED ([RankID] ASC)
);

