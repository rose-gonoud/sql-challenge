-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    primary_key VARCHAR(4) NOT NULL,
    deptName VARCHAR(20) NOT NULL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS departmentEmployees
(
    employeeID INTEGER NOT NULL,
    departmentID VARCHAR(4) NOT NULL,
    inDeptFromDate DATE NOT NULL,
    inDeptUntilDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS allEmployees
(
    primary_key INTEGER NOT NULL,
    birthday DATE NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    gender CHARACTER(1) NOT NULL,
    hireDate DATE NOT NULL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS departmentManagers
(
    departmentID VARCHAR(4) NOT NULL,
    employeeID INTEGER NOT NULL,
    managerFromDate DATE NOT NULL,
    managerUntilDate DATE NOT NULL    
);

CREATE TABLE IF NOT EXISTS salaries
(
    employeeID INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    salaryFromDate DATE NOT NULL,
    salaryUntilDate DATE NOT NULL    
);

CREATE TABLE IF NOT EXISTS titles
(
    employeeID INTEGER NOT NULL,
    title VARCHAR(20) NOT NULL,
    titleFromDate DATE NOT NULL,
    titleUntilDate DATE NOT NULL    
);

-- Create FKs
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (employeeID)
    REFERENCES allEmployees(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE titles
    ADD    FOREIGN KEY (employeeID)
    REFERENCES allEmployees(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE departmentManagers
    ADD    FOREIGN KEY (employeeID)
    REFERENCES allEmployees(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE departmentEmployees
    ADD    FOREIGN KEY (employeeID)
    REFERENCES allEmployees(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE departmentManagers
    ADD    FOREIGN KEY (departmentID)
    REFERENCES departments(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE departmentEmployees
    ADD    FOREIGN KEY (departmentID)
    REFERENCES departments(primary_key)
    MATCH SIMPLE
;
-- Create Indexes