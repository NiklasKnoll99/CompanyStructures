CREATE TABLE [dbo].[Department]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[DepartmentName] NVARCHAR(128) NOT NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
