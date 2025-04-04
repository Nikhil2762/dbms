set serveroutput on;
create or replace trigger display_slary_changes before insert or update or delete on customers for each row
Declare
sal_diff number;
begin if inserting then
dbms_output.put_line('New Employee Added :'||:NEW.NAME);
dbms_output.put_line('New Salary :'||:NEW.Salary);
ELSE IF UPDATING then
    sal_diff := NEW.Salary -: OLD.Salary;
    dbms_output.put_line('Updating Employee :'||:OLD.NAME);
    dbms_output.put_line('Old Salary :'||:OLD.Salary);
    dbms_output.put_line('New Salary :'||:NEW.Salary);
    dbms_output.put_line('Salary Difference :'||:sal_diff);
ELSE IF DELETING THEN 
    dbms_output.put_line('Employee Deleted :'||:OLD.NAME);
    dbms_output.put_line('Deleted Salary :'||:OLD.Salary);
END IF;
END;
/