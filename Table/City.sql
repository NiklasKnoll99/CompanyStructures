CREATE TABLE [dbo].[City]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[PostCode] NVARCHAR(16),
	[CityName] NVARCHAR(128),
	[ProvinceId] INT REFERENCES Province(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
