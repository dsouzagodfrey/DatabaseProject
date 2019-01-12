CREATE TABLE [Department]( 
   [DepartmentID] [INT] IDENTITY(1,1) NOT NULL PRIMARY KEY, 
   [Name] VARCHAR(250) NOT NULL,
   [DepartmentManager] INT NULL,
) ON [PRIMARY];
