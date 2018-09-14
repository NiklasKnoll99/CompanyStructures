CREATE PROCEDURE spCreateOrUpdateEmployee

	@Id INT = NULL,
	@FirstName NVARCHAR(128) = NULL,
	@LastName NVARCHAR(128) = NULL,
	@Birthday DATE = NULL,
	@Gender TINYINT = NULL,
	@Pay MONEY = NULL

AS

BEGIN
	DECLARE @RetVal INT

	IF (((SELECT Employee.Id FROM Employee WHERE Employee.Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Employee(FirstName, LastName, Birthday, Gender, Pay)
			VALUES(@FirstName, @LastName, @Birthday, @Gender, @Pay)
		SET @RetVal = @@IDENTITY
		RETURN @RetVal
	END

	ELSE
	BEGIN
		UPDATE Employee
			SET FirstName = @FirstName,
				LastName = @LastName,
				Birthday = @Birthday,
				Gender = @Gender,
				Pay = @Pay
			WHERE Id = @Id
		SET @RetVal = @Id
		RETURN @RetVal
	END
END
