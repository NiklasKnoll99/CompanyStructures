CREATE VIEW [dbo].[viDepartment]
	AS SELECT	d.Id,
				d.DepartmentName,
				c.CompanyName
	FROM [Department] AS d	INNER JOIN [Department2Address] AS da ON da.DepartmentId = d.Id
							INNER JOIN [Address] AS a ON da.AddressId = a.Id
							INNER JOIN [Company] AS c ON c.Id = a.CompanyId
