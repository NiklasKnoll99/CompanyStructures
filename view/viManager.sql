CREATE VIEW [dbo].[viManager]
	AS SELECT Manager.Id, Manager.EmployeeId, Manager.DepartmentId, Manager.EmploymentTimeId, Manager.CreationTime FROM [Manager] WHERE Manager.DeleteTime IS NULL
