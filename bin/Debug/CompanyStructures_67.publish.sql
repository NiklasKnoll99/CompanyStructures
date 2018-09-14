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
PRINT N'[dbo].[spCreateOrUpdateEmployee] wird geändert....';


GO
ALTER PROCEDURE spCreateOrUpdateEmployee

	@Id INT = NULL,
	@FirstName NVARCHAR(128) = NULL,
	@LastName NVARCHAR(128) = NULL,
	@Birthday DATE = NULL,
	@Gender TINYINT = NULL,
	@Pay MONEY = NULL

AS

BEGIN
	IF (((SELECT Employee.Id FROM Employee WHERE Employee.Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Employee(FirstName, LastName, Birthday, Gender, Pay)
			VALUES(@FirstName, @LastName, @Birthday, @Gender, @Pay)
		RETURN @@IDENTITY
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
		RETURN @Id
	END
END
GO
PRINT N'Update abgeschlossen.';


GO
