CREATE TABLE [dbo].[Department]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Description] NVARCHAR(128) NOT NULL,
	[CompanyId] INT NOT NULL REFERENCES Company(Id),
	[ManagerId] INT NOT NULL REFERENCES Manager(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7) NOT NULL
)
