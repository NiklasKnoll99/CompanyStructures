﻿CREATE TABLE [dbo].[Department2Address]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[AddressId] INT NOT NULL REFERENCES Address(Id),
	[DepartmentId] INT NOT NULL REFERENCES Department(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
)
