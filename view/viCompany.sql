CREATE VIEW [dbo].[viCompany]
	AS SELECT Company.Id, Company.CompanyName, Company.LegalForm, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
