CREATE TABLE table_name; SELECT * FROM table_name;
ALTER TABLE department add primary key(dept_no);
ALTER TABLE instructor ADD FOREIGN KEY(dept_no) REFERENCES department(dept_no); 
ALTER TABLE department ADD COLUMN budget int;
CREATE INDEX idx1 ON instructor(mob_no);
CREATE VIEW view1 AS SELECT ins_id,ins_name,dept_no,mob_no FROM instructor;
ALTER TABLE department DROP budget;
ALTER TABLE course MODIFY title varchar(125);
ALTER TABLE course AUTO_INCREMENT=101; -- Only one AUTO_INCREMENT key created for each table which is primary key 
TRUNCATE TABLE course; -- Deletes all the records without droping the table 
DROP TABLE course;

-- Extra 
- CREATE VIEW view2 AS SELECT department.dept_no,dept_name,ins_name FROM department JOIN instructor ON department.dept_no = instructor.dept_no; -- For creating the view made of two tables connected to each other 
- DROP VIEW view2  -- For dropping view 
- DROP TABLE teaches 
