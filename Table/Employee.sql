CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[FirstName] NVARCHAR(128),
	[LastName] NVARCHAR(128),
	[Birthday] DATE,
	[Gender] TINYINT,
	[Pay] MONEY,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
