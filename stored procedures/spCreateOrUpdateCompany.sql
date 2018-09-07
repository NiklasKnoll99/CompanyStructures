CREATE PROCEDURE spCreateOrUpdateCompany

	@id INT,
	@companyName NVARCHAR(256)

AS
	BEGIN
		IF ((SELECT Company.Id FROM Company WHERE Company.Id = @id) IS NULL)
		BEGIN
			INSERT INTO Company(CompanyName)
			VALUES (@companyName)
			RETURN SELECT Company.Id FROM Company WHERE Company.CompanyName = @companyName
		END

		ELSE
		BEGIN
			UPDATE Company
			SET Company.CompanyName = @companyName, Company.CreationTime = GetDate()
			WHERE Company.Id = @id
			RETURN @id
		END
	END