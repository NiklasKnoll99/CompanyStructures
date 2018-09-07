/*
Bereitstellungsskript für Training-NK-Company

Dieser Code wurde von einem Tool generiert.
Änderungen an dieser Datei führen möglicherweise zu falschem Verhalten und gehen verloren, falls
der Code neu generiert wird.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Training-NK-Company"
:setvar DefaultFilePrefix "Training-NK-Company"
:setvar DefaultDataPath "D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "D:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Überprüfen Sie den SQLCMD-Modus, und deaktivieren Sie die Skriptausführung, wenn der SQLCMD-Modus nicht unterstützt wird.
Um das Skript nach dem Aktivieren des SQLCMD-Modus erneut zu aktivieren, führen Sie folgenden Befehl aus:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Der SQLCMD-Modus muss aktiviert sein, damit dieses Skript erfolgreich ausgeführt werden kann.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'[dbo].[spCreateOrUpdateCompany] wird geändert....';


GO
ALTER PROCEDURE spCreateOrUpdateCompany

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
GO
PRINT N'Update abgeschlossen.';


GO
