CREATE TABLE [dbo].[Department]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[DepartmentName] NVARCHAR(128) NOT NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
