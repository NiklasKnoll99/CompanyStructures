CREATE VIEW [dbo].[viCompany]
	AS SELECT Company.Id, Company.CompanyName, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
