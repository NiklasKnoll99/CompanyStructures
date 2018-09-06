CREATE VIEW [dbo].[viProvince]
	AS SELECT Province.Id, Province.ProvinceName, Province.Country, Province.CreationTime FROM [Province] WHERE Province.DeleteTime IS NULL
