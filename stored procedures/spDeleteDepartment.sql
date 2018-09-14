CREATE PROCEDURE spDeleteDepartment

	@Id INT

AS

BEGIN
	DECLARE @RetVal INT

	IF ((SELECT Id FROM Department WHERE Id = @Id) IS NOT NULL)
	BEGIN
		UPDATE Department
			SET DeleteTime = GetDate()
		WHERE Id = @Id

		SET @RetVal = @Id
		RETURN @RetVal
	END

	ELSE
	BEGIN
		SET @RetVal = -1
		RETURN @RetVal
	END
END