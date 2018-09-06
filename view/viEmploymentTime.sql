CREATE VIEW [dbo].[viEmploymentTime]
	AS SELECT EmploymentTime.Id, EmploymentTime.EmploymentStart, EmploymentTime.EmploymentEnd, EmploymentTime.CreationTime FROM [EmploymentTime] WHERE EmploymentTime.DeleteTime IS NULL
