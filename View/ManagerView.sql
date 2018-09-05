CREATE VIEW [dbo].[ManagerView]
	AS SELECT Manager.Id, Manager.FirstName, Manager.LastName FROM [Manager] WHERE Manager.DeleteTime IS NULL
