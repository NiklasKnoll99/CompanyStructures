﻿CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[FirstName] NVARCHAR(128) NOT NULL,
	[LastName] NVARCHAR(128) NOT NULL,
	[Birthday] DATE NOT NULL,
	[EmploymentStart] DATE NOT NULL,
	[EmploymentEnd] DATE,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
