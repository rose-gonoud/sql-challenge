-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS Departments
(
    primary_key VARCHAR(4) NOT NULL,
    deptName VARCHAR(20) NOT NULL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS "Department Employees"
(
    employeeID INTEGER NOT NULL,
    departmentID VARCHAR(4) NOT NULL,
    inDeptFromDate DATE NOT NULL,
    inDeptUntilDate DATE NOT NULL    
);

CREATE TABLE IF NOT EXISTS "All Employees"
(
    primary_key INTEGER NOT NULL,
    birthday DATE NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    gender CHARACTER(1) NOT NULL,
    hireDate DATE NOT NULL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS "Department Managers"
(
    departmentID VARCHAR(4) NOT NULL,
    employeeID INTEGER NOT NULL,
    managerFromDate DATE NOT NULL,
    managerUntilDate DATE NOT NULL    
);

CREATE TABLE IF NOT EXISTS "Salaries"
(
    employeeID INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    salaryFromDate DATE NOT NULL,
    salaryUntilDate DATE NOT NULL    
);

CREATE TABLE IF NOT EXISTS "Titles"
(
    employeeID INTEGER NOT NULL,
    title VARCHAR(20) NOT NULL,
    titleFromDate DATE NOT NULL,
    titleUntilDate DATE NOT NULL    
);


-- Create FKs
    
ALTER TABLE "Salaries"
    ADD    FOREIGN KEY (employeeID)
    REFERENCES "All Employees"(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE "Titles"
    ADD    FOREIGN KEY (employeeID)
    REFERENCES "All Employees"(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE "Department Managers"
    ADD    FOREIGN KEY (employeeID)
    REFERENCES "All Employees"(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE "Department Employees"
    ADD    FOREIGN KEY (employeeID)
    REFERENCES "All Employees"(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE "Department Managers"
    ADD    FOREIGN KEY (departmentID)
    REFERENCES Departments(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE "Department Employees"
    ADD    FOREIGN KEY (departmentID)
    REFERENCES Departments(primary_key)
    MATCH SIMPLE
;
    

-- Create Indexes