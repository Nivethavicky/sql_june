desc student;

create database db;
show databases;
use db;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    major VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
    
);

show tables;

alter table students add column city varchar(50) not null; 

alter table students change column city cit varchar(500);

alter table students modify cit int;
alter table students modify cit varchar(40);

alter table students drop column cit; 

alter table students rename to student;
select * from student;
 
 INSERT INTO student (first_name, last_name, date_of_birth, gender, major, email, phone_number)
VALUES
    ('Jane', 'Smith', '1999-08-23', 'F', 'Mathematics', 'jane.smith@example.com', '234-567-8901'),
    ('Alice', 'Johnson', '2001-03-12', 'F', 'Physics', 'alice.johnson@example.com', '345-678-9012'),
    ('Bob', 'Brown', '2000-07-30', 'M', 'Engineering', 'bob.brown@example.com', '456-789-0123');
    
    truncate table student;

update student set fiRSt_name="viki", gender='M' WHERE STUDENT_ID=1;

update student set fiRSt_name="viki", gender='M';

DELETE FROM STUDENT WHERE STUDENT_ID=1;

DELETE FROM STUDENT;
INSERT INTO student (first_name, last_name, date_of_birth, gender, major, email, phone_number)
VALUES
    ('Emily', 'Davis', '1998-11-22', 'F', 'Biology', 'emily.davis@example.com', '567-890-1234'),
    ('Michael', 'Wilson', '1997-02-10', 'M', 'Chemistry', 'michael.wilson@example.com', '678-901-2345'),
    ('Sarah', 'Miller', '2002-05-15', 'F', 'History', 'sarah.miller@example.com', '789-012-3456'),
    ('David', 'Garcia', '2001-09-30', 'M', 'English', 'david.garcia@example.com', '890-123-4567'),
    ('Laura', 'Martinez', '1999-04-18', 'F', 'Philosophy', 'laura.martinez@example.com', '901-234-5678'),
    ('James', 'Rodriguez', '2000-12-05', 'M', 'Art', 'james.rodriguez@example.com', '012-345-6789'),
    ('Linda', 'Hernandez', '1998-06-25', 'F', 'Political Science', 'linda.hernandez@example.com', '123-456-7891'),
    ('Robert', 'Lopez', '2001-03-14', 'M', 'Sociology', 'robert.lopez@example.com', '234-567-8902'),
    ('Jessica', 'Gonzalez', '1997-07-29', 'F', 'Psychology', 'jessica.gonzalez@example.com', '345-678-9013'),
    ('Thomas', 'Perez', '2002-11-11', 'M', 'Economics', 'thomas.perez@example.com', '456-789-0124');

SELECT * FROM STUDENT LIMIT 3;
SELECT * FROM STUDENT LIMIT 3 OFFSET 12;

SELECT SUM(STUDENT_ID)AS SUM FROM STUDENT;


CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender CHAR(1),
    major VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

INSERT INTO students (first_name, last_name, date_of_birth, gender, major, email, phone_number, course_id)
VALUES
    ('John', 'Doe', '2000-01-15', 'M', 'Computer Science', 'john.doe@example.com', '123-456-7890', 1),
    ('Jane', 'Smith', '1999-08-23', 'F', 'Mathematics', 'jane.smith@example.com', '234-567-8901', 2);

DROP TABLE STUDENTS;

create table branch(
branch_id int primary key	auto_increment,
branch_name varchar(100) not null,
branch_address varchar(100)
);

create table employee(
emp_id int primary key auto_increment,
emp_name varchar(50) not null,
job_desc varchar(50),
salary int,
branch_id int,
constraint FK_branchId foreign key(branch_id) references 
branch(branch_id)
);

select * from employee;
select * from branch;

insert into branch(branch_name,branch_address)  values("chennai","12 abc road");
insert into branch(branch_name,branch_address)  values("salem","50 xyz road");
insert into branch(branch_name,branch_address)  values("bangalore","100 pqr road");
insert into branch(branch_name,branch_address)  values("madurai","250 mno road");

insert into employee(emp_name,job_desc,salary,branch_id) values ("kavya" , "frontend", 250000,2);
insert into employee(emp_name,job_desc,salary,branch_id) values ("harini" , "backend", 50000,1);
insert into employee(emp_name,job_desc,salary,branch_id) values ("sam" , "database", 60000,3);
insert into employee(emp_name,job_desc,salary,branch_id) values ("sathish" , "python", 400000,1);
insert into employee(emp_name,job_desc,salary,branch_id) values ("ismail" , "data science", 70000,2);


select employee.emp_id , employee.eMP_Name, branch.brANCH_name 
from employee LEFT join branch on employee.branch_id = branch.branch_id 
order by employee.emp_id;

select employee.emp_id , employee.eMP_Name, branch.brANCH_name 
from employee RIGHT JOIN branch on employee.branch_id = branch.branch_id 
order by employee.emp_id;

select employee.emp_id , employee.eMP_Name, branch.brANCH_name 
from employee INNER join branch on employee.branch_id = branch.branch_id 
order by employee.emp_id;

-- without join query
select employee.emp_id , employee.eMP_name, branch.brANCH_name 
from employee,branch where employee.branch_id = branch.branch_id;


--  cross join
select employee.emp_id , employee.eMP_name, branch.brANCH_name 
from employee cross join branch;


select b.br_name , count(e.emp_id) emp_count
from branch as b
join employee as e
on b.branch_id = e.branch_id
group by e.branch_id;

-- Creating the students table
CREATE TABLE stu (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Creating the courses table
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100) NOT NULL,
     constraint fkey FOREIGN KEY (student_id) REFERENCES stu(student_id)
);

-- inserting value
-- stu table
INSERT INTO stu (name) VALUES ('Alice');
INSERT INTO stu (name) VALUES ('Bob');
INSERT INTO stu (name) VALUES ('Charlie');

-- course table
INSERT INTO course (student_id, course_name) VALUES (1, 'Math');
INSERT INTO course (student_id, course_name) VALUES (1, 'English');
INSERT INTO course (student_id, course_name) VALUES (2, 'History');




select * from stu;
select * from course;

-- inner join

SELECT stu.name, course.course_name
FROM stu
INNER JOIN course
ON stu.student_id = course.student_id;

-- left join

SELECT stu.name, course.course_name
FROM stu
LEFT JOIN course
ON stu.student_id = course.student_id;

-- right join
SELECT stu.name, course.course_name
FROM stu
right JOIN course
ON stu.student_id = course.student_id;

INSERT INTO course (student_id, course_name) VALUES (3, 'Science'); -- Update to a valid student_id if needed
INSERT INTO course (student_id, course_name) VALUES (4, 'Science'); -- Update to a valid student_id if needed






select * from branch;
select * from employee;

delimiter $$
create procedure getAllBranches()
begin 	
	select * from branch ;
end$$
delimiter ;

call getAllBranches();

-- advantages:
-- 1. Reduce Network Traffic
-- 2.centralize bussiness logic
-- 3.Secure

-- Disadvantages:
-- 1. Resource Usage
-- 2. Hard to Maintain
-- 3. Difficult to Trouble Shoot


DROP procedure getAllBranches;
DROP procedure IF exists getAllBranches;

Drop procedure IF exists employeecnt;

select * from employee;

-- Variable Declare

DELIMITER $$
CREATE PROCEDURE employeecnt()
BEGIN
	DECLARE total INT DEFAULT 0;
	SELECT COUNT(emp_id)
	INTO total
	FROM employee;
	SELECT total;
END$$
DELIMITER ;

SELECT COUNT(emp_id)
	FROM employee;

CALL employeecnt();

-- pass parameter
-- IN
-- OUT
-- INOUT


-- IN
DELIMITER $$
CREATE PROCEDURE employeecnt (
IN jdesc VARCHAR(10)
)
BEGIN
	DECLARE total INT DEFAULT 0;
	SELECT COUNT(emp_id)
	INTO total
	FROM employee
	WHERE job_desc=jdesc;
	SELECT total;
END$$
DELIMITER ;

CALL employeecnt('frontend');

SELECT * from employee;



--  OUT
DELIMITER $$
CREATE PROCEDURE employeecnt (
IN jdesc VARCHAR(10),
OUT total int
)
BEGIN
	SELECT COUNT(emp_id)
	INTO total
	FROM employee
	WHERE job_desc=jdesc;
END$$
DELIMITER ;

CALL employeecnt('backend',@total);
select @total

------------------------------------------------------------------
-- INOUT

DELIMITER $$
CREATE PROCEDURE CounterIncrement (
	INOUT counter INT,
    IN increment INT
)
BEGIN
	SET counter = counter + increment; 
END$$
DELIMITER ;
 
SET @counter=5;
CALL CounterIncrement(@counter, 2);
SELECT @counter;

CALL CounterIncrement(@counter, 3);
SELECT @counter;

-- 

-- task (crud operation)

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE
);


-- insert

DELIMITER $$
CREATE PROCEDURE AddEmployee(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_hire_date DATE
)
BEGIN
    INSERT INTO employees (first_name, last_name, email, hire_date)
    VALUES (p_first_name, p_last_name, p_email, p_hire_date);
END$$

DELIMITER ;

CALL AddEmployee('John', 'Doe', 'john.doe@example.com', '2023-01-15');
CALL AddEmployee('viki', 'mathi', 'vickymathi@example.com', '2023-01-30');


-- read (select)

DELIMITER $$

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;
END$$

DELIMITER ;

CALL GetEmployees();



-- to get a specific employee id

DELIMITER $$
CREATE PROCEDURE GetEmployeeById(
    IN p_id INT
)
BEGIN
    SELECT * FROM employees WHERE id = p_id;
END$$
DELIMITER ;

CALL GetEmployeeById(1);
CALL GetEmployeeById(2);


-- update

DELIMITER $$

CREATE PROCEDURE UpdateEmployee(
    IN p_id INT,
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_hire_date DATE
)
BEGIN
    UPDATE employees
    SET first_name = p_first_name,
        last_name = p_last_name,
        email = p_email,
        hire_date = p_hire_date
    WHERE id = p_id;
END$$

DELIMITER ;

CALL UpdateEmployee(1, 'Jane', 'Doe', 'jane.doe@example.com', '2023-01-20');

-- delete
DELIMITER $$
CREATE PROCEDURE DeleteEmployee(
    IN p_id INT
)
BEGIN
    DELETE FROM employees WHERE id = p_id;
END$$

DELIMITER ;

CALL DeleteEmployee(1);





