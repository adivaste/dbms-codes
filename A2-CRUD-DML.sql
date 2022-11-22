CREATE DATABASE FP_Medical;
CREATE TABLE patient(pat_id int, pat_name varchar(255), date_adm date,age int, city varchar(255), email varchar(255));
CREATE TABLE docter(doc_id int, doc_name varchar(255), qualification varchar(255), experience int, dept varchar(255), city varchar(255), salary int);
 CREATE TABLE treats(doc_id int, pat_id int, disease varchar(255), fees int );
ALTER TABLE patient ADD PRIMARY KEY(pat_id);
ALTER TABLE docter ADD PRIMARY KEY(doc_id);
ALTER TABLE treats ADD FOREIGN KEY (doc_id) REFERENCES docter(doc_id);
ALTER TABLE treats ADD FOREIGN KEY (pat_id) REFERENCES patient(pat_id)
;

-- INSERTING 5 RECORDS
SELECT doc_name,pat_name,docter.city FROM docter INNER JOIN patient ON docter.city = patient.city;
SELECT * FROM docter WHERE qualification="MD";
SELECT pat_name, doc_name, disease FROM treats INNER JOIN docter ON treats.doc_id = docter.doc_id INNER JOIN patient ON treats.pat_id = patient.pat_id;
UPDATE docter SET qualification="MBBS" WHERE qualification="MD";
SELECT pat_name FROM patient WHERE pat_name LIKE 'A*';
SELECT pat_name FROM patient WHERE pat_name LIKE '*A';
SELECT pat_name FROM patient WHERE pat_name LIKE '_____';
SELECT DISTINCT city FROM docter UNION ALL SELECT city FROM patient2; -- To select the cities of both docter and patient. In "vertical" way data is combined using UNION ALL set operations.
SELECT avg(salary) FROM docter WHERE dept="Dentist"; -- Average salary of dept using group by 
UPDATE docter SET salary = CASE WHEN dept="Dentist" THEN salary+salary*0.05 WHEN dept="Cardio" THEN salary+salary*0.1 END WHERE dept IN("Dentist","Cardio"); -- Update salary field based on mulitple conditions
SELECT pat_name FROM patient WHERE email=NULL;
SELECT dept,avg(salary) FROM docter GROUP BY dept;
SELECT dept,avg(salary) FROM docter GROUP BY dept HAVING avg(salary) >
 50000; -- As you are using Group By so Having clause is used instread of where as a group constraint.
DELETE FROM patient WHERE pat_id=10;
SELECT pat_name FROM patient WHERE age BETWEEN 23 AND 45;
COUNT(*) -- used to count rows
SELECT dept,avg(salary) as avgsal FROM docter GROUP BY dept ORDER BY avgsal DESC LIMIT 1;  -- Max avg salary of dept 
SELECT count(DISTINCT doc_name) FROM treats INNER JOIN docter ON docte
r.doc_id = treats.doc_id; -- Count a docters who actually treated patients 
