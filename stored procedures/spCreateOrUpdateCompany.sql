CREATE PROCEDURE spCreateOrUpdateCompany

	@Id INT = NULL,
	@CompanyName NVARCHAR(256)

AS

BEGIN
	DECLARE @RetVal INT

	IF (((SELECT Id FROM Company WHERE Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Company(CompanyName)
			VALUES(@CompanyName)

		SET @RetVal = @@IDENTITY
		RETURN @RetVal
	END

	ELSE
	BEGIN
		UPDATE Company
			SET CompanyName = @CompanyName
			WHERE Id = @Id
		SET @RetVal = @Id
		RETURN @RetVal
	END
END