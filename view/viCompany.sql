CREATE VIEW [dbo].[viCompany]
	AS 
	SELECT	c.Id, 
			c.CompanyName,
			p.CountryCode,
			p.ProvinceName,
			ci.PostCode,
			ci.CityName,
			a.Street,
			a.HouseNumber
	FROM [Company] AS c INNER JOIN [Address] AS a ON a.CompanyId = c.Id 
						INNER JOIN [City] AS ci ON ci.Id = a.CityId
						INNER JOIN [Province] AS p ON p.Id = ci.ProvinceId
	WHERE c.DeleteTime IS NULL
