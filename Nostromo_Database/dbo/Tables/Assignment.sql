CREATE TABLE [dbo].[Assignment] (
    [DepartmentID] INT NOT NULL,
    [CrewMemberID] INT NOT NULL,
    CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED ([DepartmentID] ASC, [CrewMemberID] ASC),
    CONSTRAINT [FK_Assignment_CrewMember] FOREIGN KEY ([CrewMemberID]) REFERENCES [dbo].[CrewMember] ([CrewMemberID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Assignment_Department] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID]) ON DELETE CASCADE
);

