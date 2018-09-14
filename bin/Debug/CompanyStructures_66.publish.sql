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
PRINT N'[dbo].[Address] wird geändert....';


GO
ALTER TABLE [dbo].[Address] ALTER COLUMN [HouseNumber] SMALLINT NULL;

ALTER TABLE [dbo].[Address] ALTER COLUMN [Street] NVARCHAR (128) NULL;


GO
PRINT N'[dbo].[City] wird geändert....';


GO
ALTER TABLE [dbo].[City] ALTER COLUMN [CityName] NVARCHAR (128) NULL;

ALTER TABLE [dbo].[City] ALTER COLUMN [PostCode] NVARCHAR (16) NULL;


GO
PRINT N'[dbo].[Employee] wird geändert....';


GO
ALTER TABLE [dbo].[Employee] ALTER COLUMN [Birthday] DATE NULL;

ALTER TABLE [dbo].[Employee] ALTER COLUMN [FirstName] NVARCHAR (128) NULL;

ALTER TABLE [dbo].[Employee] ALTER COLUMN [Gender] TINYINT NULL;

ALTER TABLE [dbo].[Employee] ALTER COLUMN [LastName] NVARCHAR (128) NULL;


GO
PRINT N'[dbo].[Province] wird geändert....';


GO
ALTER TABLE [dbo].[Province] ALTER COLUMN [CountryCode] NVARCHAR (4) NULL;

ALTER TABLE [dbo].[Province] ALTER COLUMN [ProvinceName] NVARCHAR (128) NULL;


GO
PRINT N'[dbo].[viAddress] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viAddress]';


GO
PRINT N'[dbo].[viCompany] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viCompany]';


GO
PRINT N'[dbo].[viEmployee] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viEmployee]';


GO
PRINT N'[dbo].[viCity] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[viCity]';


GO
PRINT N'[dbo].[spCreateOrUpdateEmployee] wird aktualisiert....';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[spCreateOrUpdateEmployee]';


GO
PRINT N'Update abgeschlossen.';


GO
