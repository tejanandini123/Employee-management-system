
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);


CREATE TABLE Salaries (
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    SalaryDate DATE,
    PRIMARY KEY (EmployeeID, SalaryDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


-- Inserting data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'Human Resources'), (2, 'Engineering'), (3, 'Marketing');

-- Inserting data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate)
VALUES
(1, 'Yasin', 'shaik', 2, '2020-01-15'),
(2, 'Nandini', 'Changa', 1, '2019-03-23'),
(3, 'Yashi', 'Nanni', 3, '2021-07-19');

-- Inserting data into Salaries table
INSERT INTO Salaries (EmployeeID, SalaryAmount, SalaryDate)
VALUES
(1, 60000, '2020-12-31'),
(2, 55000, '2019-12-31'),
(3, 45000, '2021-12-31');


-- Retrieve employee details
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Calculate average salary by department
SELECT d.DepartmentName, AVG(s.SalaryAmount) AS AverageSalary
FROM Salaries s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Find employees hired in the last year
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > DATEADD(year, -1, GETDATE());

