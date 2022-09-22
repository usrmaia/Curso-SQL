USE company_temp;

SELECT * FROM employee;

-- gerente e seus departamentos
SELECT ssn, e.first_name, d.name_ 
FROM employee e, departament d 
	WHERE e.ssn = d.manager_ssn;

-- dependente dos empregados
SELECT e.first_name, d.name_, d.relationship 
FROM employee e, dependent d 
	WHERE e.ssn = d.employee_ssn;

--
SELECT birthday, address 
FROM employee 
WHERE first_name = "John" and middle_name_abbreviation = "B" and last_name = "Smith";

-- Departamento específico
SELECT * 
FROM departament 
	WHERE name_ = "Research";

SELECT * 
FROM employee e, departament d 
	WHERE d.name_ = "Research" AND d.number_ = e.dno;
    
SELECT p.name_, wo.employee_ssn, e.first_name, wo.hours
FROM project p, works_on wo, employee e
	WHERE p.number_ = wo.project_number AND wo.employee_ssn = e.ssn;

-- Exemplo de alias
SELECT concat(first_name, " ", last_name) 
FROM employee;

SELECT concat(first_name, " ", last_name) AS employee_name
FROM employee;

-- Calculando inss
SELECT first_name, last_name, salary, salary * 0.011 FROM employee;
SELECT first_name, last_name, salary, salary * 0.011 AS inss FROM employee;
SELECT first_name, last_name, salary, round(salary * 0.011, 2) AS inss FROM employee;

-- Definir um aumento
SELECT concat(e.first_name, " ", e.last_name) as complete_name, e.salary, round(e.salary * 1.10, 2) as new_salary
FROM employee e, works_on wo, project p 
WHERE e.ssn = wo.employee_ssn AND p.number_ = wo.project_number AND p.name_ = "ProductX";

-- Recumperando informações dos departamentos presentes em Stafford
SELECT d.name_ as departament_name, concat(e.first_name, " ", e.last_name) as complete_name_employee, l.location
FROM departament d, department_location l, employee e
WHERE d.number_ = l.number_ AND l.location = "Stafford" AND d.manager_ssn = e.ssn;

-- Recuperando todos os gerêntes, departamentos e seus nome
DESC employee;
SELECT d.name_ AS departament_name, p.name_ as project_name, concat(e.first_name, " ", e.last_name) as employee_name
FROM employee e, departament d, project p
WHERE d.number_ = p.number_ AND e.ssn = d.manager_ssn;

-- Empregados de Houston com like
SELECT * 
FROM employee 
WHERE address LIKE "%Houston%";

-- Intervalo de salário com between
SELECT * 
FROM employee 
WHERE salary BETWEEN 30000 AND 40000;

-- 
DESC employee;
SELECT *
FROM project
WHERE number_ in (
	(
		SELECT DISTINCT e.pno
		FROM works_on wo, employee e
		WHERE wo.employee_ssn = e.ssn AND e.last_name = "Smith"
    ) OR (
		SELECT d.number_
		FROM project p, departament d, employee e
		WHERE d.manager_ssn = e.ssn AND d.number_ = p.number_ AND e.last_name = "Smith" 
    )
);

DESC works_on;
SELECT *
FROM works_on
WHERE (project_number, hours) in (
	SELECT project_number, hours
    FROM works_on
    WHERE employee_ssn = "123456789"
);

SELECT *
FROM employee e
WHERE EXISTS (
	SELECT *
    FROM dependent d
    WHERE e.ssn = d.employee_ssn AND d.relationship = "Daughter"
);

SELECT *
FROM employee e
WHERE NOT EXISTS (
	SELECT *
    FROM dependent d
    WHERE e.ssn = d.employee_ssn
);

SELECT *
FROM employee e
WHERE 2 <= (
	SELECT count(*)
    FROM dependent d
    WHERE d.employee_ssn = e.ssn
);

-- Order by
SELECT * FROM employee;
SELECT * FROM employee ORDER BY dno;
SELECT * FROM employee ORDER BY first_name;
SELECT * FROM employee ORDER BY first_name, last_name;

DESC works_on;
SELECT DISTINCT d.name_ as departament, concat(e.first_name, " ", e.last_name) as manager 
FROM departament d, employee e, works_on wo, project p
WHERE d.number_ = e.dno AND e.ssn = d.manager_ssn AND wo.project_number = p.number_
ORDER BY d.name_; 

SELECT DISTINCT d.name_ as departament, concat(e.first_name, " ", e.last_name) as manager, p.name_, wo.hours 
FROM departament d, employee e, works_on wo, project p
WHERE (d.number_ = e.dno AND e.ssn = wo.employee_ssn AND wo.project_number = p.number_)
ORDER BY d.name_; 

-- Group by
DESC works_on;
SELECT * FROM employee;
SELECT count(*) FROM employee;

SELECT count(*)
FROM employee e, departament d 
WHERE e.dno = d.number_ and d.name_ = "Research";

SELECT count(*)
FROM employee e, departament d 
WHERE e.dno = d.number_ and d.name_ = "Research";

SELECT dno as number_departament, count(*) as count_employee, round(avg(salary), 2) as salary_avg
FROM employee
GROUP BY dno;

DESC works_on;
SELECT wo.project_number, p.name_, count(*)
FROM works_on wo, project p
WHERE wo.project_number = p.number_
GROUP BY wo.project_number;

SELECT count(DISTINCT salary) FROM employee;
SELECT sum(salary), avg(salary), max(salary), min(salary) FROM employee;

SELECT sum(salary), avg(salary), max(salary), min(salary) 
FROM employee e JOIN departament d ON e.dno = d.number_
WHERE d.name_ = "Research";

DESC project;
SELECT p.name_, p.number_, count(*)
FROM project p, works_on wo
WHERE p.number_ = wo.project_number
GROUP BY p.name_, p.number_
HAVING count(*) > 2;

SELECT dno
FROM employee
WHERE salary > 2000
GROUP BY dno
HAVING avg(salary) > 35000