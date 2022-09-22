show DATABASES;
CREATE DATABASE company_temp;
USE company_temp;

/*Consultar as Constraint do BD company_temp*/
SELECT *
FROM information_schema.table_constraints
WHERE constraint_schema = "company_temp";

CREATE TABLE employee (
	first_name VARCHAR(15) NOT NULL,
    middle_name_abbreviation char,
    last_name VARCHAR(15) NOT NULL,
    ssn char(9) NOT NULL,
    birthday DATE, 
    address VARCHAR(30),
    sex CHAR,
    salary DECIMAL(10, 2),
    super_ssn CHAR(9),
    dno INT NOT NULL,
    
    CONSTRAINT pk_employee PRIMARY KEY(ssn),
    CONSTRAINT chk_salary_salary CHECK (salary > 2000.0)
);

ALTER TABLE employee
	ADD CONSTRAINT fk_employee 
    FOREIGN KEY (super_ssn) REFERENCES employee(ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

desc departament;

CREATE TABLE departament(
	name_ VARCHAR(15) NOT NULL,
    number_ INT NOT NULL,
    manager_ssn char(9),
    manager_start_date DATE, 
    create_date DATE,
    
    CONSTRAINT chk_date_departament CHECK (create_date < manager_start_date),
    CONSTRAINT pk_departament PRIMARY KEY (number_),
    CONSTRAINT unique_name_departament UNIQUE (name_),
    CONSTRAINT fk_departament FOREIGN KEY (manager_ssn) REFERENCES employee(ssn)
);

ALTER TABLE departament DROP CONSTRAINT unique_name_departament;

CREATE TABLE department_location (
	number_ INT NOT NULL,
    location VARCHAR(15) NOT NULL,
    
    CONSTRAINT pk_department_location PRIMARY KEY (number_, location),
    CONSTRAINT fk_department_location FOREIGN KEY (number_) REFERENCES departament(number_)
);

CREATE TABLE project( 
	name_ VARCHAR(15) NOT NULL,
    number_ INT NOT NULL,
    location VARCHAR(15),
    departament_number INT NOT NULL, 
    
    CONSTRAINT pk_project PRIMARY KEY (number_),
    CONSTRAINT unique_project UNIQUE (name_),
    CONSTRAINT fk_project FOREIGN KEY (departament_number) REFERENCES departament(number_) 
);

CREATE TABLE works_on(
	employee_ssn CHAR(9) NOT NULL,
    project_number INT NOT NULL,
    hours DECIMAL(3, 1) NOT NULL, 
    
    CONSTRAINT pk_works_on PRIMARY KEY (employee_ssn, project_number),
    CONSTRAINT fk_works_on_employee_ssn FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
    CONSTRAINT fk_works_on_project_number FOREIGN KEY (project_number) REFERENCES project(number_)
);

CREATE TABLE dependent(
	employee_ssn CHAR(9) NOT NULL,
    name_ VARCHAR(15) NOT NULL,
    sex enum("M", "F", "Other"),
    birthday DATE, 
    relationship VARCHAR(9),
    age TINYINT NOT NULL,
    
    CONSTRAINT pk_dependent PRIMARY KEY (employee_ssn, name_),
    CONSTRAINT fk_dependent FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
    CONSTRAINT chk_age_dependent CHECK (age < 22)
);

SHOW TABLES;
DESC employee;