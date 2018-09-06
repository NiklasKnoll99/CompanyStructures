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
Die Spalte "[dbo].[Address].[Country]" in der Tabelle "[dbo].[Address]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.

Die Spalte "[dbo].[Address].[Province]" in der Tabelle "[dbo].[Address]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.
*/

IF EXISTS (select top 1 1 from [dbo].[Address])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[Employee].[EmploymentEnd]" wird gelöscht, es könnte zu einem Datenverlust kommen.

Die Spalte "[dbo].[Employee].[EmploymentStart]" wird gelöscht, es könnte zu einem Datenverlust kommen.

Die Spalte "[dbo].[Employee].[EmploymentTimeId]" in der Tabelle "[dbo].[Employee]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.

Die Spalte "[dbo].[Employee].[Gender]" in der Tabelle "[dbo].[Employee]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.
*/

IF EXISTS (select top 1 1 from [dbo].[Employee])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
/*
Die Spalte "[dbo].[ManagerToDepartment].[EmploymentEnd]" wird gelöscht, es könnte zu einem Datenverlust kommen.

Die Spalte "[dbo].[ManagerToDepartment].[EmploymentStart]" wird gelöscht, es könnte zu einem Datenverlust kommen.

Die Spalte "[dbo].[ManagerToDepartment].[EmploymentTimeId]" in der Tabelle "[dbo].[ManagerToDepartment]" muss hinzugefügt werden, besitzt jedoch keinen Standardwert und unterstützt keine NULL-Werte. Wenn die Tabelle Daten enthält, funktioniert das ALTER-Skript nicht. Um dieses Problem zu vermeiden, müssen Sie der Spalte einen Standardwert hinzufügen, sie so kennzeichnen, dass NULL-Werte zulässig sind, oder die Generierung von intelligenten Standardwerten als Bereitstellungsoption aktivieren.
*/

IF EXISTS (select top 1 1 from [dbo].[ManagerToDepartment])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [DF__Address__Company__1A14E395];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [DF__Address__Employe__1B0907CE];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [DF__Address__Creatio__1BFD2C07];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Company] DROP CONSTRAINT [DF__Company__Creatio__1CF15040];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [DF__Departmen__Creat__1DE57479];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Company] DROP CONSTRAINT [DF__Departmen__Creat__1ED998B2];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [DF__Employee__Creati__1FCDBCEB];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird gelöscht....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] DROP CONSTRAINT [DF__ManagerTo__Emplo__20C1E124];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird gelöscht....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] DROP CONSTRAINT [DF__ManagerTo__Creat__21B6055D];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Company__22AA2996];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Employe__239E4DCF];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Company] DROP CONSTRAINT [FK__Departmen__Addre__24927208];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Company] DROP CONSTRAINT [FK__Departmen__Depar__25869641];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird gelöscht....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] DROP CONSTRAINT [FK__ManagerTo__Depar__276EDEB3];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird gelöscht....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] DROP CONSTRAINT [FK__ManagerTo__Emplo__267ABA7A];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Address]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Address] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [CompanyId]    INT            DEFAULT NULL NULL,
    [EmployeeId]   INT            DEFAULT NULL NULL,
    [Street]       NVARCHAR (128) NOT NULL,
    [HouseNumber]  SMALLINT       NOT NULL,
    [City]         NVARCHAR (128) NOT NULL,
    [Province]     NVARCHAR (128) NOT NULL,
    [Country]      NVARCHAR (128) NOT NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Address])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Address] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Address] ([Id], [CompanyId], [EmployeeId], [Street], [HouseNumber], [City], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [CompanyId],
                 [EmployeeId],
                 [Street],
                 [HouseNumber],
                 [City],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Address]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Address] OFF;
    END

DROP TABLE [dbo].[Address];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Address]', N'Address';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Company]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Company] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [CompanyName]  NVARCHAR (256) NOT NULL,
    [LegalForm]    NVARCHAR (64)  NOT NULL,
    [CreationTime] DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Company])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Company] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Company] ([Id], [CompanyName], [LegalForm], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [CompanyName],
                 [LegalForm],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Company]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Company] OFF;
    END

DROP TABLE [dbo].[Company];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Company]', N'Company';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [DepartmentName] NVARCHAR (128) NOT NULL,
    [CreationTime]   DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]     DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Department])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Department] ([Id], [DepartmentName], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [DepartmentName],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Department]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department] OFF;
    END

DROP TABLE [dbo].[Department];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department]', N'Department';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department2Company]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department2Company] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [AddressId]    INT           NOT NULL,
    [DepartmentId] INT           NOT NULL,
    [CreationTime] DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    [DeleteTime]   DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Department2Company])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department2Company] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Department2Company] ([Id], [AddressId], [DepartmentId], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [AddressId],
                 [DepartmentId],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Department2Company]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Department2Company] OFF;
    END

DROP TABLE [dbo].[Department2Company];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department2Company]', N'Department2Company';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Employee]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Employee] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]        NVARCHAR (128) NOT NULL,
    [LastName]         NVARCHAR (128) NOT NULL,
    [Birthday]         DATE           NOT NULL,
    [Gender]           TINYINT        NOT NULL,
    [EmploymentTimeId] INT            NOT NULL,
    [Pay]              MONEY          NOT NULL,
    [CreationTime]     DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]       DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Employee])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Employee] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Employee] ([Id], [FirstName], [LastName], [Birthday], [Pay], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [FirstName],
                 [LastName],
                 [Birthday],
                 [Pay],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[Employee]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Employee] OFF;
    END

DROP TABLE [dbo].[Employee];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Employee]', N'Employee';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[ManagerToDepartment]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_ManagerToDepartment] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeId]       INT           NOT NULL,
    [DepartmentId]     INT           NOT NULL,
    [EmploymentTimeId] INT           NOT NULL,
    [CreationTime]     DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    [DeleteTime]       DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[ManagerToDepartment])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_ManagerToDepartment] ON;
        INSERT INTO [dbo].[tmp_ms_xx_ManagerToDepartment] ([Id], [EmployeeId], [DepartmentId], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [EmployeeId],
                 [DepartmentId],
                 [CreationTime],
                 [DeleteTime]
        FROM     [dbo].[ManagerToDepartment]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_ManagerToDepartment] OFF;
    END

DROP TABLE [dbo].[ManagerToDepartment];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_ManagerToDepartment]', N'ManagerToDepartment';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'[dbo].[EmploymentTime] wird erstellt....';


GO
CREATE TABLE [dbo].[EmploymentTime] (
    [Id]              INT  IDENTITY (1, 1) NOT NULL,
    [EmploymentStart] DATE NOT NULL,
    [EmploymentEnd]   DATE NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address] WITH NOCHECK
    ADD FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Department2Company] WITH NOCHECK
    ADD FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Department2Company] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([EmploymentTimeId]) REFERENCES [dbo].[EmploymentTime] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] WITH NOCHECK
    ADD FOREIGN KEY ([EmploymentTimeId]) REFERENCES [dbo].[EmploymentTime] ([Id]);


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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Address'), OBJECT_ID(N'dbo.Department2Company'), OBJECT_ID(N'dbo.ManagerToDepartment'), OBJECT_ID(N'dbo.Employee'))
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
