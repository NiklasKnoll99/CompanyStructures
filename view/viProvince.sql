CREATE VIEW [dbo].[viProvince]
	AS SELECT Province.Id, Province.ProvinceName, Province.CountryCode, Province.CreationTime FROM [Province] WHERE Province.DeleteTime IS NULL
