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
PRINT N'Creating [dbo].[spCreateOrUpdateDepartment]...';


GO
CREATE PROCEDURE spCreateOrUpdateDepartment

	@Id INT = NULL,
	@DepartmentName NVARCHAR(128)

AS

BEGIN
	IF (((SELECT Id FROM Department WHERE Id = @Id) IS NULL) OR (@Id IS NULL))
	BEGIN
		INSERT INTO Department(DepartmentName)
			VALUES(@DepartmentName)
		RETURN @@IDENTITY
	END

	ELSE
	BEGIN
		UPDATE Department
			SET DepartmentName = @DepartmentName
			WHERE Id = @Id
		RETURN @Id
	END
END
GO
PRINT N'Update complete.';


GO