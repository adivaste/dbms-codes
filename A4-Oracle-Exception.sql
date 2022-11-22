create table Borrower(roll_in int,name varchar(15),date_of_issue date,name_of_book varchar(15),status varchar(15));
create table Fine(roll_in int,fine_date date,amount int);

insert into Borrower values(1,'Priya',to_date('2022-09-01','YYYY-MM-DD'), 'TOC', 'i');

DECLARE
roll_in_ int;
name_of_book_ varchar(15);
date_of_issue_ date;

total_no_of_days_ int:=0;
total_no_of_days_to_fined_ int:=0;
total_fine_amount_ int:=0;
exce_valid_roll_ exception;

BEGIN
roll_in_ := 1;
name_of_book_ := 'TOC';

if roll_in_ < 1 then
        raise exce_valid_roll_;
end if;
select date_of_issue into date_of_issue_ from Borrower where roll_in=roll_in_ and name_of_book=name_of_book_;

total_no_of_days_ := sysdate - date_of_issue_;
if (total_no_of_days_>15 and total_no_of_days_<=30) then
        total_no_of_days_to_fined_:= total_no_of_days_ - 15;
        total_fine_amount_:= total_no_of_days_to_fined_*5;
elsif (total_no_of_days_>30) then
        total_no_of_days_to_fined_:= total_no_of_days_ - 15;
        total_fine_amount_:= total_no_of_days_to_fined_*50;
else
        total_fine_amount_:=0;
end if;

insert into Fine values(roll_in_,sysdate,total_fine_amount_);
update Borrower set status='R' where roll_in_=roll_in and name_of_book_=name_of_book;

EXCEPTION
when exce_valid_roll_ then
        dbms_output.put_line('Enter a valid number');
when no_data_found then
        dbms_output.put_line('No data found');
when others then
        dbms_output.put_line('other error');

END;
/

SELECT * FROM Borrower;
SELECT * FROM Fine;

-- Remember : 
        -- 1. Use Single Quotes ('') instead of double ( "" ) for string;
        -- 2. Use := for assignment instead of =
        -- 3. 'sysdate' to get current date 
        -- 4. Datatypes are [int,date,varchar(255)]
        -- 5. While inserting the dates use format to_date('2022-12-12','YYYY-MM-DD')
        -- 6. After end; statement use a forward slash (/) as you are excecuting the single line query and not declaring any block *(acc. to me)
        -- 7. 'SET SERVEROUTPUT ON' to output statements.

