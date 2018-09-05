CREATE VIEW [dbo].[DepartmentView]
	AS SELECT Department.Id, Department.Description, Department.CompanyId, Department.ManagerId FROM [Department] WHERE Department.DeleteTime IS NULL
