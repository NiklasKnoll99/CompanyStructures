CREATE PROCEDURE spDeleteCompany

	@Id INT

AS

BEGIN
	DECLARE @RetVal INT

	IF ((SELECT Id FROM Company WHERE Id = @Id) IS NOT NULL)
	BEGIN
		UPDATE Company
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