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
Die Spalte "[dbo].[Department2Address].[Id]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Department2Address])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[Employee].[EmploymentTimeId]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Employee])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[Employee2Department].[Id]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Employee2Department])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[Manager2Department].[Id]" wird gelöscht, es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[Manager2Department])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [DF__tmp_ms_xx__Creat__2DE6D218];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee2Department] DROP CONSTRAINT [DF__tmp_ms_xx__Creat__6754599E];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Manager2Department] DROP CONSTRAINT [DF__Manager2D__Creat__2645B050];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [FK__Departmen__Addre__31B762FC];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [FK__Departmen__Depar__32AB8735];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee2Department] DROP CONSTRAINT [FK__Employee2__Emplo__3587F3E0];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee2Department] DROP CONSTRAINT [FK__Employee2__Depar__73BA3083];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee2Department] DROP CONSTRAINT [FK__Employee2__Emplo__74AE54BC];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Manager2Department] DROP CONSTRAINT [FK__Manager2D__Depar__282DF8C2];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Manager2Department] DROP CONSTRAINT [FK__Manager2D__Emplo__29221CFB];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__Employ__367C1819];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department2Address]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department2Address] (
    [AddressId]    INT           NOT NULL,
    [DepartmentId] INT           NOT NULL,
    [CreationTime] DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC, [DepartmentId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Department2Address])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Department2Address] ([AddressId], [DepartmentId], [CreationTime])
        SELECT   [AddressId],
                 [DepartmentId],
                 [CreationTime]
        FROM     [dbo].[Department2Address]
        ORDER BY [AddressId] ASC, [DepartmentId] ASC;
    END

DROP TABLE [dbo].[Department2Address];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department2Address]', N'Department2Address';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'[dbo].[Employee] wird geändert....';


GO
ALTER TABLE [dbo].[Employee] DROP COLUMN [EmploymentTimeId];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Employee2Department]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Employee2Department] (
    [EmployeeId]       INT           NOT NULL,
    [DepartmentId]     INT           NOT NULL,
    [EmploymentTimeId] INT           NOT NULL,
    [CreationTime]     DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC, [DepartmentId] ASC, [EmploymentTimeId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Employee2Department])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Employee2Department] ([EmployeeId], [DepartmentId], [EmploymentTimeId], [CreationTime])
        SELECT   [EmployeeId],
                 [DepartmentId],
                 [EmploymentTimeId],
                 [CreationTime]
        FROM     [dbo].[Employee2Department]
        ORDER BY [EmployeeId] ASC, [DepartmentId] ASC, [EmploymentTimeId] ASC;
    END

DROP TABLE [dbo].[Employee2Department];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Employee2Department]', N'Employee2Department';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Manager2Department]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Manager2Department] (
    [EmployeeId]       INT           NOT NULL,
    [DepartmentId]     INT           NOT NULL,
    [EmploymentTimeId] INT           NOT NULL,
    [CreationTime]     DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    [DeleteTime]       DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC, [DepartmentId] ASC, [EmploymentTimeId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Manager2Department])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Manager2Department] ([EmployeeId], [DepartmentId], [EmploymentTimeId], [CreationTime], [DeleteTime])
        SELECT   [EmployeeId],
                 [DepartmentId],
                 [EmploymentTimeId],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Manager2Department]
        ORDER BY [EmployeeId] ASC, [DepartmentId] ASC, [EmploymentTimeId] ASC;
    END

DROP TABLE [dbo].[Manager2Department];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Manager2Department]', N'Manager2Department';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Department2Address] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Department2Address] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee2Department] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee2Department] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee2Department] WITH NOCHECK
    ADD FOREIGN KEY ([EmploymentTimeId]) REFERENCES [dbo].[EmploymentTime] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Manager2Department] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Manager2Department] WITH NOCHECK
    ADD FOREIGN KEY ([EmploymentTimeId]) REFERENCES [dbo].[EmploymentTime] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Manager2Department] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'[dbo].[viEmployee] wird geändert....';


GO
ALTER VIEW [dbo].[viEmployee]
	AS SELECT Employee.Id, Employee.FirstName, Employee.LastName, Employee.Birthday, Employee.Gender, Employee.Pay, Employee.CreationTime FROM [Employee] WHERE Employee.DeleteTime IS NULL
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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Department2Address'), OBJECT_ID(N'dbo.Employee2Department'), OBJECT_ID(N'dbo.Manager2Department'))
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
