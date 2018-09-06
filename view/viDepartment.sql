CREATE VIEW [dbo].[viDepartment]
	AS SELECT Department.Id, Department.DepartmentName, Department.CreationTime FROM [Department] WHERE Department.DeleteTime IS NULL
