﻿/*
Deployment script for Training-NK-Company

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
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
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[spCreateOrUpdateCompany]...';


GO
ALTER PROCEDURE spCreateOrUpdateCompany

	@Id INT = NULL,
	@CompanyName NVARCHAR(256)

AS

BEGIN
	DECLARE @RetVal INT

	IF (((SELECT Id FROM Company WHERE Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Company(CompanyName)
			VALUES(@CompanyName)

		SET @RetVal = @@IDENTITY
		RETURN @RetVal
	END

	ELSE
	BEGIN
		UPDATE Company
			SET CompanyName = @CompanyName
			WHERE Id = @Id
		SET @RetVal = @Id
		RETURN @RetVal
	END
END
GO
PRINT N'Altering [dbo].[spCreateOrUpdateDepartment]...';


GO
ALTER PROCEDURE spCreateOrUpdateDepartment

	@Id INT = NULL,
	@DepartmentName NVARCHAR(128)

AS

BEGIN
	DECLARE @RetVal INT

	IF (((SELECT Id FROM Department WHERE Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Department(DepartmentName)
			VALUES(@DepartmentName)
		SET @RetVal = @@IDENTITY
		RETURN @RetVal
	END

	ELSE
	BEGIN
		UPDATE Department
			SET DepartmentName = @DepartmentName
			WHERE Id = @Id
		SET @RetVal = @Id
		RETURN @RetVal
	END
END
GO
PRINT N'Altering [dbo].[spCreateOrUpdateEmployee]...';


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
	DECLARE @RetVal INT

	IF (((SELECT Employee.Id FROM Employee WHERE Employee.Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Employee(FirstName, LastName, Birthday, Gender, Pay)
			VALUES(@FirstName, @LastName, @Birthday, @Gender, @Pay)
		SET @RetVal = @@IDENTITY
		RETURN @RetVal
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
		SET @RetVal = @Id
		RETURN @RetVal
	END
END
GO
PRINT N'Update complete.';


GO