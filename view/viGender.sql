CREATE VIEW [dbo].[viGender]
	AS SELECT Gender.Id, Gender.GenderName, Gender.CreationTime FROM [Gender] WHERE Gender.DeleteTime IS NULL
