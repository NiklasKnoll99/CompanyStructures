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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'[dbo].[Address] wird erstellt....';


GO
CREATE TABLE [dbo].[Address] (
    [Id]           INT            NOT NULL,
    [CompanyId]    INT            NULL,
    [EmployeeId]   INT            NULL,
    [Street]       NVARCHAR (128) NOT NULL,
    [HouseNumber]  SMALLINT       NOT NULL,
    [City]         NVARCHAR (128) NOT NULL,
    [CreationTime] DATETIME2 (7)  NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'[dbo].[Company] wird erstellt....';


GO
CREATE TABLE [dbo].[Company] (
    [Id]           INT            NOT NULL,
    [CompanyName]  NVARCHAR (256) NOT NULL,
    [LegalForm]    NVARCHAR (64)  NOT NULL,
    [CreationTime] DATETIME2 (7)  NOT NULL,
    [DeleteTime]   DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'[dbo].[Department] wird erstellt....';


GO
CREATE TABLE [dbo].[Department] (
    [Id]             INT            NOT NULL,
    [DepartmentName] NVARCHAR (128) NOT NULL,
    [CreationTime]   DATETIME2 (7)  NOT NULL,
    [DeleteTime]     DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'[dbo].[Department2Company] wird erstellt....';


GO
CREATE TABLE [dbo].[Department2Company] (
    [Id]           INT           NOT NULL,
    [AddressId]    INT           NOT NULL,
    [DepartmentId] INT           NOT NULL,
    [CreationTime] DATETIME2 (7) NOT NULL,
    [DeleteTime]   DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'[dbo].[Employee] wird erstellt....';


GO
CREATE TABLE [dbo].[Employee] (
    [Id]              INT            NOT NULL,
    [FirstName]       NVARCHAR (128) NOT NULL,
    [LastName]        NVARCHAR (128) NOT NULL,
    [Birthday]        DATE           NOT NULL,
    [EmploymentStart] DATE           NOT NULL,
    [EmploymentEnd]   DATE           NULL,
    [Pay]             MONEY          NOT NULL,
    [CreationTime]    DATETIME2 (7)  NOT NULL,
    [DeleteTime]      DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'[dbo].[ManagerToDepartment] wird erstellt....';


GO
CREATE TABLE [dbo].[ManagerToDepartment] (
    [Id]              INT           NOT NULL,
    [EmployeeId]      INT           NOT NULL,
    [DepartmentId]    INT           NOT NULL,
    [EmploymentStart] DATE          NOT NULL,
    [EmploymentEnd]   DATE          NULL,
    [CreationTime]    DATETIME2 (7) NOT NULL,
    [DeleteTime]      DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT NULL FOR [CompanyId];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT NULL FOR [EmployeeId];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Company]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Department]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Company] wird erstellt....';


GO
ALTER TABLE [dbo].[Department2Company]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT GetDate() FOR [CreationTime];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment]
    ADD DEFAULT NULL FOR [EmploymentEnd];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment]
    ADD DEFAULT GetDate() FOR [CreationTime];


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
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird erstellt....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] WITH NOCHECK
    ADD FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);


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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Address'), OBJECT_ID(N'dbo.Department2Company'), OBJECT_ID(N'dbo.ManagerToDepartment'))
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
