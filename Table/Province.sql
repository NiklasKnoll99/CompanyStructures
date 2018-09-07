CREATE TABLE [dbo].[Province]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[ProvinceName] NVARCHAR(128) NOT NULL,
	[CountryCode] NVARCHAR(4) NOT NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
