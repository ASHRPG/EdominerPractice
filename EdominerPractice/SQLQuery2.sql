Create Table Departments (
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL
	);

	INSERT INTO Departments (Name) VALUES 
	('IT'),
	('Finance'),
	('HR'),
	('Marketing');