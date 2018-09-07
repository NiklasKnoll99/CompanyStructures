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
/*
Die Spalte "[dbo].[Company].[LegalForm]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Company])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'[dbo].[Company] wird geändert....';


GO
ALTER TABLE [dbo].[Company] DROP COLUMN [LegalForm];


GO
ALTER TABLE [dbo].[Company] ALTER COLUMN [CompanyName] NVARCHAR (256) NOT NULL;


GO
PRINT N'[dbo].[viCompany] wird geändert....';


GO
ALTER VIEW [dbo].[viCompany]
	AS SELECT Company.Id, Company.CompanyName, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
GO
PRINT N'[dbo].[spInsertOrUpdateCompany] wird geändert....';


GO
ALTER PROCEDURE spInsertOrUpdateCompany

	@id  INT,
	@companyName NVARCHAR(128)

AS
	BEGIN
		IF (@id IS NULL)
		BEGIN
			INSERT INTO [dbo].[Company] ([CompanyName]) 
				VALUES
				(@companyName)
		END

		ELSE
		BEGIN
			UPDATE [dbo].[Company]
			SET [CompanyName] = @companyName
			WHERE [Id] = @id
		END

		RETURN (SELECT id FROM Company WHERE id = @id)
	END
GO
PRINT N'Update abgeschlossen.';


GO
