CREATE TABLE library(book_id int, title varchar(255), author varchar(255),edition int, no_of_copies int);
CREATE TABLE library_audit_table(book_id int, title varchar(255), author varchar(255), edition int, no_of_copies int, date_of_mod varchar(255),type_of_operation varchar(255), username varchar(255));
CREATE TABLE transaction_table(transaction_id int, book_id int, i_r varchar(1), no_of_copies_ir int);

-- Create a trigger to track records of the updated and deleted from library to insert in library_audit_table

CREATE TRIGGER modify_audits
AFTER UPDATE on library
FOR EACH ROW
BEGIN 
DECLARE status varchar(255);
SET status="Updated";
INSERT INTO library_audit_table values(old.book_id, old.title, old.author, old.edition, old.no_of_copies, curdate(), status, user());
END;

CREATE TRIGGER modify_audits2
AFTER DELETE on library
FOR EACH ROW
BEGIN
DECLARE status varchar(255);
SET status="Deleted";
INSERT INTO library_audit_table values(old.book_id, old.title, old.author, old.edition, old.no_of_copies, curdate(), status, user());
END;

-- To create a trigger to check the number of copies available before issuing a book if number of copies issuing > the number of books available then issue the number of books which are available.

CREATE TRIGGER issue_if_available
BEFORE INSERT on transaction_table
FOR EACH ROW
BEGIN
DECLARE no_of_copies_available int;
SELECT no_of_copies INTO no_of_copies_available FROM library WHERE book_id=new.book_id;
IF no_of_copies_available < new.no_of_copies_ir THEN
SET new.no_of_copies_ir = no_of_copies_available;
END IF;
END;

-- To update the number of copies available after the book is issued or returned.

CREATE TRIGGER update_copies
AFTER INSERT ON transaction_table
FOR EACH ROW
BEGIN
IF new.i_r = "I" THEN
UPDATE library set no_of_copies=no_of_copies-new.no_of_copies_ir WHERE book_id=new.book_id;
ELSE
UPDATE library set no_of_copies=no_of_copies+new.no_of_copies_ir WHERE book_id=new.book_id;
END IF;
END;

