-- Procedure Syntax 
/*
        DELIMITER //
        CREATE PROCEDURE ctr_customers (ctr VARCHAR(50))
        BEGIN
        SELECT customer_id, first_name
        FROM Customers
        WHERE Country = ctr;
        END //
        DELIMITER ;

        CALL ctr_customers(4);
        DROP PROCEDURE order_details;
*/


-- Creating Tables
CREATE TABLE student_marks(name,total_marks);
CREATE TABLE result(int roll_no,name varchar(255), class varchar(255));

-- Creating the Procedure
CREATE PROCEDURE procedure_grade(in roll_no1 int, in name1 varchar(255), in total_marks1 int)
BEGIN
        DECLARE class1 varchar(255);
        IF total_marks1 >=990 and total_marks1 <=1500 THEN
                SET class1 = "Distincition";
        ELSEIF total_marks1 >=900 and total_marks1 <= 989 THEN
                SET class1 = "Class 1";
        ELSEIF total_marks1 >= 825 and total_marks1 <= 899 THEN
                SET class1 = "Class 2";
        ELSEIF total_marks1 >= 700 and total_marks1 <= 824 THEN
                SET class1 = "Pass";
        ELSE
                SET class1 = "Fail";
        END IF;

        INSERT INTO result values(roll_no1, name1, class1);
END;


-- Remember : 
        -- 1. Here Syntax for 'else if' is 'ELSEIF' not like Oracle ('ELSIF')
        -- 2. Ending the if-else block with 'END IF;'
        -- 3. No use of 'AS' and 'IS' while declaring the Procedure.
