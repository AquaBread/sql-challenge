-- Defines each title_id to a title
CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
);

-- Employee information
CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title VARCHAR REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE
);

-- The salaries for each employee
CREATE TABLE salaries (
    emp_no INTEGER REFERENCES employees(emp_no),
    salary INTEGER,
    PRIMARY KEY (emp_no, salary)
);

-- Defines each dept_no to a dept_name
CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

-- Lists which employee works for which department
CREATE TABLE dept_emp (
    emp_no INTEGER REFERENCES employees(emp_no),
    dept_no VARCHAR REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Lists which employee is the manager for each department
CREATE TABLE dept_manager (
    dept_no VARCHAR REFERENCES departments(dept_no),
    emp_no INTEGER REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);