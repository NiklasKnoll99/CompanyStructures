﻿CREATE TABLE [dbo].[EmploymentTime]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[EmploymentStart] DATE NOT NULL,
	[EmploymentEnd] DATE
)