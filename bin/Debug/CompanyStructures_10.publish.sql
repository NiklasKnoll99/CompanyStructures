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
PRINT N'[dbo].[viAddress] wird erstellt....';


GO
CREATE VIEW [dbo].[viAddress]
	AS SELECT Address.Id, Address.CompanyId, Address.EmployeeId, Address.Street, Address. HouseNumber, Address.CityId, Address.CreationTime FROM [Address] WHERE Address.DeleteTime IS NULL
GO
PRINT N'[dbo].[viCity] wird erstellt....';


GO
CREATE VIEW [dbo].[viCity]
	AS SELECT City.PostCode, City.CityName, City.ProvinceId, City.CreationTime FROM [City] WHERE City.DeleteTime IS NULL
GO
PRINT N'[dbo].[viCompany] wird erstellt....';


GO
CREATE VIEW [dbo].[viCompany]
	AS SELECT Company.Id, Company.CompanyName, Company.LegalForm, Company.CreationTime FROM [Company] WHERE Company.DeleteTime IS NULL
GO
PRINT N'[dbo].[viDepartment] wird erstellt....';


GO
CREATE VIEW [dbo].[viDepartment]
	AS SELECT Department.Id, Department.DepartmentName, Department.CreationTime FROM [Department] WHERE Department.DeleteTime IS NULL
GO
PRINT N'[dbo].[viEmployee] wird erstellt....';


GO
CREATE VIEW [dbo].[viEmployee]
	AS SELECT Employee.Id, Employee.FirstName, Employee.LastName, Employee.Birthday, Employee.Gender, Employee.EmploymentTimeId, Employee.Pay, Employee.CreationTime FROM [Employee] WHERE Employee.DeleteTime IS NULL
GO
PRINT N'[dbo].[viEmploymentTime] wird erstellt....';


GO
CREATE VIEW [dbo].[viEmploymentTime]
	AS SELECT EmploymentTime.Id, EmploymentTime.EmploymentStart, EmploymentTime.EmploymentEnd, EmploymentTime.CreationTime FROM [EmploymentTime] WHERE EmploymentTime.DeleteTime IS NULL
GO
PRINT N'[dbo].[viGender] wird erstellt....';


GO
CREATE VIEW [dbo].[viGender]
	AS SELECT Gender.Id, Gender.GenderName, Gender.CreationTime FROM [Gender] WHERE Gender.DeleteTime IS NULL
GO
PRINT N'[dbo].[viProvince] wird erstellt....';


GO
CREATE VIEW [dbo].[viProvince]
	AS SELECT Province.Id, Province.ProvinceName, Province.Country, Province.CreationTime FROM [Province] WHERE Province.DeleteTime IS NULL
GO
PRINT N'Update abgeschlossen.';


GO
