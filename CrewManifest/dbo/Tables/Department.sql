CREATE TABLE [dbo].[Department] (
    [DepartmentID]          INT            NOT NULL,
    [DepartmentName]        NVARCHAR (50)  NOT NULL,
    [DepartmentDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DepartmentID] ASC)
);

