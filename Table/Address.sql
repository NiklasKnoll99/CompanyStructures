CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[CompanyId] INT DEFAULT NULL REFERENCES Company(Id),
	[EmployeeId] INT DEFAULT NULL REFERENCES Employee(Id),
	[Street] NVARCHAR(128),
	[HouseNumber] SMALLINT,
	[CityId] INT REFERENCES City(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
