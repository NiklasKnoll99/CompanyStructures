CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[FirstName] NVARCHAR(128) NOT NULL,
	[LastName] NVARCHAR(128) NOT NULL,
	[Birthday] DATE NOT NULL,
	[Gender] TINYINT NOT NULL,
	[EmploymentTimeId] INT REFERENCES EmploymentTime(Id),
	[Pay] MONEY,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
