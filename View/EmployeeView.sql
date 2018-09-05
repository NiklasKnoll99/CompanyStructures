CREATE VIEW [dbo].[EmployeeView]
	AS SELECT Employee.Id, Employee.FirstName, Employee.LastName, Employee.DepartmentId FROM [Employee] WHERE Employee.DeleteTime IS NULL
