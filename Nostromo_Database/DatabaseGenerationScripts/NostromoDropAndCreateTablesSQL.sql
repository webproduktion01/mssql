USE [Nostromos]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 2016-03-19 08:25:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Deletes all tables first */
DECLARE @Sql NVARCHAR(500) DECLARE @Cursor CURSOR

SET @Cursor = CURSOR FAST_FORWARD FOR
SELECT DISTINCT sql = 'ALTER TABLE [' + tc2.TABLE_NAME + '] DROP [' + rc1.CONSTRAINT_NAME + ']'
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc1
LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc2 ON tc2.CONSTRAINT_NAME =rc1.CONSTRAINT_NAME

OPEN @Cursor FETCH NEXT FROM @Cursor INTO @Sql

WHILE (@@FETCH_STATUS = 0)
BEGIN
Exec SP_EXECUTESQL @Sql
FETCH NEXT FROM @Cursor INTO @Sql
END

CLOSE @Cursor DEALLOCATE @Cursor
GO

EXEC sp_MSForEachTable 'DROP TABLE ?'
GO


CREATE TABLE [dbo].[Assignment](
	[DepartmentID] [int] NOT NULL,
	[CrewMemberID] [int] NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC,
	[CrewMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CrewMember]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrewMember](
	[CrewMemberID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[BirthPlanetID] [int] NOT NULL,
	[RankID] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[DeceasedID] [int] NULL,
	[Salary] [money] NULL,
	[SpeciesID] [int] NOT NULL,
 CONSTRAINT [PK_CrewMember] PRIMARY KEY CLUSTERED 
(
	[CrewMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Death]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Death](
	[DeathID] [int] IDENTITY(1,1) NOT NULL,
	[DeathCauseID] [int] NULL,
	[DeathDescription] [nvarchar](max) NULL,
	[DeathDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Death] PRIMARY KEY CLUSTERED 
(
	[DeathID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeathCause]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeathCause](
	[DeathCauseID] [int] IDENTITY(1,1) NOT NULL,
	[DeathCause] [nvarchar](50) NOT NULL,
	[DeathCauseDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeathCause] PRIMARY KEY CLUSTERED 
(
	[DeathCauseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Planet]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planet](
	[PlanetID] [int] IDENTITY(1,1) NOT NULL,
	[PlanetName] [nvarchar](50) NOT NULL,
	[PlanetDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Planet] PRIMARY KEY CLUSTERED 
(
	[PlanetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rank]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](50) NOT NULL,
	[RankDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Species]    Script Date: 2016-03-19 08:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[SpeciesID] [int] IDENTITY(1,1) NOT NULL,
	[SpeciesName] [nvarchar](50) NOT NULL,
	[SpeciesDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[SpeciesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_CrewMember] FOREIGN KEY([CrewMemberID])
REFERENCES [dbo].[CrewMember] ([CrewMemberID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_CrewMember]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Department]
GO
ALTER TABLE [dbo].[CrewMember]  WITH CHECK ADD FOREIGN KEY([SpeciesID])
REFERENCES [dbo].[Species] ([SpeciesID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrewMember]  WITH CHECK ADD  CONSTRAINT [FK_CrewMember_Death] FOREIGN KEY([Deceased])
REFERENCES [dbo].[Death] ([DeathID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrewMember] CHECK CONSTRAINT [FK_CrewMember_Death]
GO
ALTER TABLE [dbo].[CrewMember]  WITH CHECK ADD  CONSTRAINT [FK_CrewMember_Planet] FOREIGN KEY([BirthPlanetID])
REFERENCES [dbo].[Planet] ([PlanetID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrewMember] CHECK CONSTRAINT [FK_CrewMember_Planet]
GO
ALTER TABLE [dbo].[CrewMember]  WITH CHECK ADD  CONSTRAINT [FK_CrewMember_Rank] FOREIGN KEY([RankID])
REFERENCES [dbo].[Rank] ([RankID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrewMember] CHECK CONSTRAINT [FK_CrewMember_Rank]
GO
ALTER TABLE [dbo].[Death]  WITH CHECK ADD  CONSTRAINT [FK_Death_DeathCause] FOREIGN KEY([DeathCauseID])
REFERENCES [dbo].[DeathCause] ([DeathCauseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Death] CHECK CONSTRAINT [FK_Death_DeathCause]
GO
