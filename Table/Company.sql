﻿CREATE TABLE [dbo].[Company]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Description] NVARCHAR(256) NOT NULL, 
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)