CREATE TABLE [dbo].[EmploymentTime]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[EmploymentStart] DATETIME2(7) NOT NULL,
	[EmploymentEnd] DATETIME2(7),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
