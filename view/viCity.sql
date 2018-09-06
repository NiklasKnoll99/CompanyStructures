CREATE VIEW [dbo].[viCity]
	AS SELECT City.PostCode, City.CityName, City.ProvinceId, City.CreationTime FROM [City] WHERE City.DeleteTime IS NULL
