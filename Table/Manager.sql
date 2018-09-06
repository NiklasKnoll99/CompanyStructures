CREATE TABLE [dbo].[Manager]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[EmployeeId] INT NOT NULL REFERENCES Employee(Id),
	[DepartmentId] INT NOT NULL REFERENCES Department(Id),
	[EmploymentTimeId] INT NOT NULL REFERENCES EmploymentTime(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	[DeleteTime] DATETIME2(7)
)
