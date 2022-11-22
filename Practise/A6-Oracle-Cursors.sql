DECLARE 
	-- declaring the cursor
	CURSOR cursor_name IS SELECT * FROM student;
	
	student_rec student%ROWTYPE;
	row_count int;
BEGIN 
	-- open the cursor
	OPEN cursor_name;
		
		-- Open a loop
		LOOP

			-- fetch the cursor
			FETCH cursor_name INTO student_rec;
				EXIT WHEN cursor_name%NOTFOUND;
				SELECT count(*) INTO row_count FROM new_student WHERE roll_no = student_rec.roll_no;
				IF row_count = 0 THEN
					INSERT INTO new_student values(student_rec.roll_no, student_rec.name, student_rec.marks);
				END IF;
					
		
		-- Close a loop
		END LOOP
	
	-- close the cursor
	CLOSE cursor_name;
END;
