select * from Employees;
select * from Departments;

update Employees set Department = 1 where EmployeeID = 1;
update Employees set Department = 3 where EmployeeID = 2;
update Employees set Department = 2 where EmployeeID = 3;
update Employees set Department = 4 where EmployeeID = 4;
update Employees set Department = 1 where EmployeeID = 5;
update Employees set Department = 1 where EmployeeID = 7;


SELECT Name, COUNT(*) AS Total
FROM Departments
GROUP BY Name
HAVING COUNT(*) > 1;

ALTER TABLE Departments
ADD CONSTRAINT UQ_Departments_Name UNIQUE (Name);

ALTER TABLE Employees
ADD DepartmentID INT NULL;

UPDATE Employees
SET DepartmentID = TRY_CONVERT(INT, Department);

SELECT EmployeeID, EmployeeName,
       Department, DepartmentID
FROM Employees;

SELECT E.EmployeeID, E.EmployeeName, E.DepartmentID
FROM Employees E
LEFT JOIN Departments D
    ON E.DepartmentID = D.ID
WHERE E.DepartmentID IS NULL
   OR D.ID IS NULL;

   ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (DepartmentID)
REFERENCES Departments(ID);

BEGIN TRANSACTION;

UPDATE Employees
SET DepartmentID = 99
WHERE EmployeeID = 1;

ROLLBACK TRANSACTION;


SELECT ID, Name
FROM Departments;

SELECT EmployeeID, EmployeeName, DepartmentID
FROM Employees;