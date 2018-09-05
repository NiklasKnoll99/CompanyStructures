CREATE VIEW [dbo].[CompanyView]
	AS SELECT Company.Id, Company.Description, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
