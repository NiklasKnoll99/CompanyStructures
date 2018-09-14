CREATE PROCEDURE spCreateOrUpdateDepartment

	@Id INT = NULL,
	@DepartmentName NVARCHAR(128)

AS

BEGIN
	DECLARE @RetVal INT

	IF (((SELECT Id FROM Department WHERE Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Department(DepartmentName)
			VALUES(@DepartmentName)
		SET @RetVal = @@IDENTITY
		RETURN @RetVal
	END

	ELSE
	BEGIN
		UPDATE Department
			SET DepartmentName = @DepartmentName
			WHERE Id = @Id
		SET @RetVal = @Id
		RETURN @RetVal
	END
END
