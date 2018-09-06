﻿CREATE TABLE [dbo].[City]
(
	[PostCode] NVARCHAR(64) NOT NULL PRIMARY KEY,
	[CityName] NVARCHAR(128) NOT NULL,
	[ProvinceId] INT NOT NULL REFERENCES Province(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
