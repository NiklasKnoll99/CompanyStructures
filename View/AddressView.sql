CREATE VIEW [dbo].[AddressView]
	AS SELECT Address.Id, Address.CompanyId, Address.Street, Address.HouseNumber, Address.City FROM [Address] WHERE Address.DeleteTime IS NULL
