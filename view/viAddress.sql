CREATE VIEW [dbo].[viAddress]
	AS SELECT Address.Id, Address.CompanyId, Address.EmployeeId, Address.Street, Address. HouseNumber, Address.CityId, Address.CreationTime FROM [Address] WHERE Address.DeleteTime IS NULL
