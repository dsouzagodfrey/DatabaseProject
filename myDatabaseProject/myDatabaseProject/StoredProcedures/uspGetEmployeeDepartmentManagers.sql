CREATE PROCEDURE [dbo].[uspGetEmployeeDepartmentManagers]
AS
BEGIN
    SET NOCOUNT ON;
	;WITH Employee_Department (DepartmentID, FirstName, LastName, DepartmentName)
	AS 
	(
		SELECT D.DepartmentID, E.FirstName, E.LastName, D.[Name] FROM Department D 
		LEFT JOIN Employee E ON D.DepartmentID = E.DepartmentID
	),
	Department_Manager (DepartmentID,Department, DepartmentManager)
	AS
	(
		SELECT D.DepartmentID, D.Name, CONCAT(E.FirstName, ' ', E.LastName) FROM
		Department D LEFT JOIN Employee E ON D.DepartmentManager = E.EmployeeID
	)
	SELECT ED.FirstName, ED.LastName, ED.DepartmentName, DM.DepartmentManager FROM 
	Employee_Department ED
	LEFT JOIN Department_Manager DM ON ED.DepartmentID = DM.DepartmentID
END;
GO