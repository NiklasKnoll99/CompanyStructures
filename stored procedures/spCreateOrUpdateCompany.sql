CREATE PROCEDURE spCreateOrUpdateCompany

	@id INT = NULL,
	@companyName NVARCHAR(256)

AS

BEGIN
	IF (((SELECT Company.Id FROM Company WHERE Company.Id = @id) IS NULL) OR (@id IS NULL))
	BEGIN
		IF ((SELECT Count(Company.Id) FROM Company WHERE Company.CompanyName = @companyName) = 0)
		BEGIN
			INSERT INTO Company(Company.CompanyName)
				VALUES(@companyName)
			RETURN @@IDENTITY
		END

		ELSE
		BEGIN
			RETURN -1
		END
	END

	ELSE
	BEGIN
		IF ((SELECT Count(Company.Id) FROM Company WHERE Company.CompanyName = @companyName) = 0)
		BEGIN
			UPDATE Company
				SET Company.CompanyName = @companyName,
					Company.CreationTime = GetDate()
				WHERE Company.Id = @id
			RETURN @id
		END

		ELSE
		BEGIN
			RETURN -2
		END
	END
END