CREATE TABLE [dbo].[Employee2Department]
(
	[EmployeeId] INT NOT NULL REFERENCES Employee(Id),
	[DepartmentId] INT NOT NULL REFERENCES Department(Id),
	[EmploymentTimeId] INT REFERENCES EmploymentTime(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	PRIMARY KEY ([EmployeeId], [DepartmentId], [EmploymentTimeId])
)
