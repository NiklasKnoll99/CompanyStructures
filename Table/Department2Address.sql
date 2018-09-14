CREATE TABLE [dbo].[Department2Address]
(
	[AddressId] INT NOT NULL REFERENCES Address(Id),
	[DepartmentId] INT NOT NULL REFERENCES Department(Id),
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT GetDate(),
	PRIMARY KEY([AddressId], [DepartmentId])
)
