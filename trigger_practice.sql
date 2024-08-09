use practice;

/*
	CREATE TRIGGER trigger_name    
    (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
         ON table_name FOR EACH ROW    
         BEGIN    
        --variable declarations    
        --trigger code    
        END;     

*/

drop table employee;

CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  

INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

select * from employee;

delimiter $$

create trigger before_insert_empworkinghours 
before insert on employee 
for each row 
begin 
	if new.working_hours < 0
		then set new.working_hours = 0;
	end if;
end$$

delimiter ;

INSERT INTO employee VALUES    
('Markus', 'Former', '2020-10-08', 14);  

insert into employee 
values
('Alexander', 'Actor', '2020-10-012', -13); 


	
