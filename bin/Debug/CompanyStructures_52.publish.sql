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
Der Typ für Spalte "EmploymentEnd" in Tabelle "[dbo].[EmploymentTime]" ist derzeit " DATETIME2 (7) NULL", wird jedoch in " DATE NULL" geändert. Es könnte zu einem Datenverlust kommen.

Der Typ für Spalte "EmploymentStart" in Tabelle "[dbo].[EmploymentTime]" ist derzeit " DATETIME2 (7) NOT NULL", wird jedoch in " DATE NOT NULL" geändert. Es könnte zu einem Datenverlust kommen.
*/

IF EXISTS (select top 1 1 from [dbo].[EmploymentTime])
    RAISERROR (N'Zeilen wurden erkannt. Das Schemaupdate wird beendet, da es möglicherweise zu einem Datenverlust kommt.', 16, 127) WITH NOWAIT

GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [DF__tmp_ms_xx__Creat__2180FB33];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [DF__tmp_ms_xx__Creat__4222D4EF];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [FK__Departmen__Addre__22751F6C];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Department2Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Department2Address] DROP CONSTRAINT [FK__Departmen__Depar__236943A5];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Manager2Department] DROP CONSTRAINT [FK__Manager2D__Emplo__2739D489];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager] wird gelöscht....';


GO
ALTER TABLE [dbo].[Manager] DROP CONSTRAINT [FK__ManagerTo__Emplo__534D60F1];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[ManagerToDepartment] wird gelöscht....';


GO
ALTER TABLE [dbo].[ManagerToDepartment] DROP CONSTRAINT [FK__ManagerTo__Emplo__5DCAEF64];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird gelöscht....';


GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__Employe__6FE99F9F];


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird gelöscht....';


GO
ALTER TABLE [dbo].[Employee2Department] DROP CONSTRAINT [FK__Employee2__Emplo__72C60C4A];


GO
PRINT N'Das erneute Erstellen der Tabelle "[dbo].[Department2Address]" wird gestartet....';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Department2Address] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [AddressId]    INT           NOT NULL,
    [DepartmentId] INT           NOT NULL,
    [CreationTime] DATETIME2 (7) DEFAULT GetDate() NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Department2Address])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Department2Address] ([AddressId], [DepartmentId], [CreationTime])
        SELECT [AddressId],
               [DepartmentId],
               [CreationTime]
        FROM   [dbo].[Department2Address];
    END

DROP TABLE [dbo].[Department2Address];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Department2Address]', N'Department2Address';

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
    [EmploymentTimeId] INT            NULL,
    [Pay]              MONEY          NULL,
    [CreationTime]     DATETIME2 (7)  DEFAULT GetDate() NOT NULL,
    [DeleteTime]       DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Employee])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Employee] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Employee] ([Id], [FirstName], [LastName], [Birthday], [Gender], [Pay], [CreationTime], [DeleteTime])
        SELECT   [Id],
                 [FirstName],
                 [LastName],
                 [Birthday],
                 [Gender],
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
PRINT N'[dbo].[EmploymentTime] wird geändert....';


GO
ALTER TABLE [dbo].[EmploymentTime] ALTER COLUMN [EmploymentEnd] DATE NULL;

ALTER TABLE [dbo].[EmploymentTime] ALTER COLUMN [EmploymentStart] DATE NOT NULL;


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
PRINT N'unbenannte Einschränkungen auf [dbo].[Manager] wird erstellt....';


GO
ALTER TABLE [dbo].[Manager] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Address] wird erstellt....';


GO
ALTER TABLE [dbo].[Address] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee2Department] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee2Department] WITH NOCHECK
    ADD FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([Id]);


GO
PRINT N'unbenannte Einschränkungen auf [dbo].[Employee] wird erstellt....';


GO
ALTER TABLE [dbo].[Employee] WITH NOCHECK
    ADD FOREIGN KEY ([EmploymentTimeId]) REFERENCES [dbo].[EmploymentTime] ([Id]);


GO
PRINT N'[dbo].[viEmployee] wird geändert....';


GO
ALTER VIEW [dbo].[viEmployee]
	AS SELECT Employee.Id, Employee.FirstName, Employee.LastName, Employee.Birthday, Employee.Gender, Employee.EmploymentTimeId, Employee.Pay, Employee.CreationTime FROM [Employee] WHERE Employee.DeleteTime IS NULL
GO
PRINT N'[dbo].[viAddress] wird geändert....';


GO
ALTER VIEW [dbo].[viAddress]
	AS SELECT Address.Id, Address.CompanyId, Address.EmployeeId, Address.Street, Address. HouseNumber, Address.CityId, Address.CreationTime FROM [Address] WHERE Address.DeleteTime IS NULL
GO
PRINT N'[dbo].[viCity] wird geändert....';


GO
ALTER VIEW [dbo].[viCity]
	AS SELECT City.PostCode, City.CityName, City.ProvinceId, City.CreationTime FROM [City] WHERE City.DeleteTime IS NULL
GO
PRINT N'[dbo].[viCompany] wird geändert....';


GO
ALTER VIEW [dbo].[viCompany]
	AS SELECT Company.Id, Company.CompanyName, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
GO
PRINT N'[dbo].[viDepartment] wird geändert....';


GO
ALTER VIEW [dbo].[viDepartment]
	AS SELECT Department.Id, Department.DepartmentName, Department.CreationTime FROM [Department] WHERE Department.DeleteTime IS NULL
GO
PRINT N'[dbo].[viDepartment2Address] wird erstellt....';


GO
CREATE VIEW [dbo].[viDepartment2Address]
	AS SELECT Department2Address.Id, Department2Address.AddressId, Department2Address.DepartmentId, Department2Address.CreationTime FROM [Department2Address]
GO
PRINT N'[dbo].[viEmployee2Department] wird erstellt....';


GO
CREATE VIEW [dbo].[viEmployee2Department]
	AS SELECT Employee2Department.Id, Employee2Department.EmployeeId, Employee2Department.DepartmentId, Employee2Department.EmploymentTimeId, Employee2Department.CreationTime FROM [Employee2Department]
GO
PRINT N'[dbo].[viEmploymentTime] wird erstellt....';


GO
CREATE VIEW [dbo].[viEmploymentTime]
	AS SELECT EmploymentTime.Id, EmploymentTime.EmploymentStart, EmploymentTime.EmploymentEnd, EmploymentTime.CreationTime FROM [EmploymentTime] WHERE EmploymentTime.DeleteTime IS NULL
GO
PRINT N'[dbo].[viManager] wird erstellt....';


GO
CREATE VIEW [dbo].[viManager]
	AS SELECT Manager.Id, Manager.EmployeeId, Manager.DepartmentId, Manager.EmploymentTimeId, Manager.CreationTime FROM [Manager] WHERE Manager.DeleteTime IS NULL
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
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Department2Address'), OBJECT_ID(N'dbo.Manager'), OBJECT_ID(N'dbo.Address'), OBJECT_ID(N'dbo.Employee2Department'), OBJECT_ID(N'dbo.Employee'))
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
