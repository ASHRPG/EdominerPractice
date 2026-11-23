Create Database EdominerPracticeDB;


CREATE Table Employees (
	EmployeeID INT PRIMARY KEY Identity,
	EmployeeName NVARCHAR(100) NOT NULL,
	Department NVARCHAR(100) NOT NULL,
	Designation NVARCHAR(100) NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL,
	JoinDate DATE NOT NULL
	);

Insert Into Employees (EmployeeName, Department, Designation, Salary, JoinDate) Values
('John Doe', 'IT', 'Software Engineer', 60000.00, '2020-01-15'),
('Jane Smith', 'HR', 'HR Manager', 75000.00, '2019-03-10'),
('Michael Johnson', 'Finance', 'Accountant', 55000.00, '2021-06-20'),
('Emily Davis', 'Marketing', 'Marketing Specialist', 50000.00, '2022-02-05'),
('William Brown', 'IT', 'System Administrator', 65000.00, '2018-11-30');
