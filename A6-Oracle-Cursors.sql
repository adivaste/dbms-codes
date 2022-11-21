-- Syntax for Oracle Cursors 
/* 
        DECLARE 
                -- declaring the Cursors
        BEGIN 
                -- open the cursors

                -- fetching the cursors

                -- closing the cursor
        END;
*/
        
-- Basic Template --
CREATE TABLE student(roll_no int, name_of_std varchar(255), marks int);
INSERT INTO student values(1, 'Aditya Vaste', 55);
INSERT INTO student values(2, 'Rohit Sharma', 26);
INSERT INTO student values(3, 'Virat Kohli', 87);

SELECT * FROM student;

DECLARE
    CURSOR simple_cursor IS SELECT * FROM student;
    student_rec student%ROWTYPE;
BEGIN
     
        OPEN simple_cursor;
            LOOP
                FETCH simple_cursor INTO student_rec;
                dbms_output.put_line('Roll No : ' || student_rec.roll_no || ' Name :' || student_rec.name_of_std || ' Marks : ' || student_rec.marks);
                EXIT WHEN simple_cursor%NOTFOUND;
            END LOOP;
        CLOSE simple_cursor;
END;
-- Basic Template Ends --

---------------------- Main Code ----------------------

-- CREATE TABLE student(roll_no int, name_of_std varchar(255), marks int);
-- CREATE TABLE new_student(roll_no int, name_of_std varchar(255), marks int);

-- INSERT INTO student values(4, 'Aditya Vaste1', 55);
-- INSERT INTO student values(2, 'Rohit Sharma', 26);
-- INSERT INTO student values(3, 'Virat Kohli', 87);

SELECT * FROM student;
-- DELETE FROM student_rec;

DECLARE
    CURSOR simple_cursor IS SELECT * FROM student;
    student_rec student%ROWTYPE;

    count1 int;
BEGIN
        OPEN simple_cursor;
            LOOP
                FETCH simple_cursor INTO student_rec;
                    EXIT WHEN simple_cursor%NOTFOUND;
                    SELECT COUNT(*) INTO count1 FROM new_student WHERE roll_no=student_rec.roll_no;
                    IF count1 < 1 THEN
                        INSERT INTO new_student values(student_rec.roll_no, student_rec.name_of_std, student_rec.marks);
                        dbms_output.put_line('Roll No : ' || student_rec.roll_no || ' Name :' || student_rec.name_of_std || ' Marks : ' || student_rec.marks);
                    END IF;
            END LOOP;
        CLOSE simple_cursor;
END;

SELECT * FROM new_student;

