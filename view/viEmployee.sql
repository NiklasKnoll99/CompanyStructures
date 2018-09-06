CREATE VIEW [dbo].[viEmployee]
	AS SELECT Employee.Id, Employee.FirstName, Employee.LastName, Employee.Birthday, Employee.Gender, Employee.EmploymentTimeId, Employee.Pay, Employee.CreationTime FROM [Employee] WHERE Employee.DeleteTime IS NULL
