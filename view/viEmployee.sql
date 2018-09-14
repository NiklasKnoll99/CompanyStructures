CREATE VIEW [dbo].[viEmployee]
	AS SELECT	e.Id, 
				e.FirstName, 
				e.LastName, 
				e.Birthday, 
				e.Gender, 
				e.Pay,
				p.CountryCode,
				p.ProvinceName,
				c.PostCode,
				c.CityName,
				a.Street,
				a.HouseNumber
	FROM [Employee] AS e INNER JOIN [Address] AS a ON e.Id = a.EmployeeId
						 INNER JOIN [City] AS c ON a.CityId = c.Id
						 INNER JOIN [Province] AS p ON c.ProvinceId = p.Id
	WHERE e.DeleteTime IS NULL
