﻿CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[CompanyId] INT NOT NULL REFERENCES Company(Id),
	[Street] NVARCHAR(128) NOT NULL,
	[HouseNumber] SMALLINT NOT NULL,
	[City] NVARCHAR(128) NOT NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7) NOT NULL
)
