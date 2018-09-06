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
Die Spalte "[dbo].[Address].[Country]" wird gelöscht, es könnte zu einem Datenverlust kommen.

Die Spalte "[dbo].[Address].[Province]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Address])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[City].[ProvinceId]" in der Tabelle "[dbo].[City]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.
*/

IF EXISTS (select top 1 1 from [dbo].[City])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Der Typ für Spalte "Id" in Tabelle "[dbo].[Gender]" ist derzeit " INT NOT NULL", wird jedoch in " TINYINT NOT NULL" geändert. Es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Gender])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'unbenannte Einschränkungen auf [dbo].[City] wird gelöscht....';


GO
ALTER TABLE [dbo].[City] DROP CONSTRAINT [DF__City__CreationTi__6D0D32F4];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Gender] wird gelöscht....';


GO
ALTER TABLE [dbo].[Gender] DROP CONSTRAINT [DF__Gender__Creation__6E01572D];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__CityId__71D1E811];


GO
PRINT N'[dbo].[Address] wird geändert....';


GO
ALTER TABLE [dbo].[Address] DROP COLUMN [Country], COLUMN [Province];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[City]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_City] (
    [PostCode]     NVARCHAR (64)  NOT NULL,
    [CityName]     NVARCHAR (128) NOT NULL,
    [ProvinceId]   INT            NOT NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([PostCode] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[City])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_City] ([PostCode], [CityName], [CreationTime], [DeleteTime])
        SELECT   [PostCode],
                 [CityName],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[City]
        ORDER BY [PostCode] ASC;
    END

DROP TABLE [dbo].[City];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_City]', N'City';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Gender]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Gender] (
    [Id]           TINYINT       NOT NULL,
    [GenderName]   NVARCHAR (32) NOT NULL,
    [CreationTime] DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    [DeleteTime]   DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Gender])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Gender] ([Id], [GenderName], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [GenderName],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Gender]
        ORDER BY [Id] ASC;
    END

DROP TABLE [dbo].[Gender];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Gender]', N'Gender';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'[dbo].[Province] wird erstellt....';


GO
CREATE TABLE [dbo].[Province] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [ProvinceName] NVARCHAR (128) NOT NULL,
    [Country]      NVARCHAR (128) NOT NULL,
    [CreationTime] DATETIME2 (7)  NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Province] wird erstellt....';


GO
ALTER TABLE [dbo].[Province]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address] WITH NOCHECK
    ADD FOREIGN KEY ([CityId]) REFERENCES [dbo].[City] ([PostCode]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[City] wird erstellt....';


GO
ALTER TABLE [dbo].[City] WITH NOCHECK
    ADD FOREIGN KEY ([ProvinceId]) REFERENCES [dbo].[Province] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([Gender]) REFERENCES [dbo].[Gender] ([Id]);


GO
PRINT N'Vorhandene Daten werden auf neu erstellte Einschränkungen hin überprüft.';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Address'), OBJECT_ID(N'dbo.City'), OBJECT_ID(N'dbo.Employee'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Einschränkung wird überprüft: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Fehler beim Überprüfen der Einschränkung:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Fehler beim Überprüfen von Einschränkungen', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update abgeschlossen.';


GO
