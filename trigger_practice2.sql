use practice;

select * from student_info;

-- -------------------------------------------
delimiter $$
create trigger before_student_insert
before insert on student_info
for each row
begin
	if new.marks < 0 then
		set new.marks = 0;
	end if;
end $$;

delimiter ;
-- -------------------------------------------

-- 2. Create a Trigger: After Insert
 delimiter $$
 
 create trigger after_student_insert
 after insert on student_info
 for each row
 begin
		insert into student_log (action , stud_id , timestamp)
        value ('INSERT' , new.stud_id  , now());
 
 end $$
 
 delimiter ;
 
 -- -------------------------------------------
 
 -- 3. Create a Trigger: Before Update

delimiter $$

create trigger before_update_student
before update on student_info
for each row
begin
	if new.phone is null then
    set new.phone = old.phone;
    end if;

end $$

delimiter ;

-- --------------------------------------------

-- 4. Create a Trigger: After Update
delimiter $$
create trigger after_update_student
after update  on student_info
for each row
begin
	insert into student_log(action , stud_id , timestamp)
    values ('update' , new.stud_id , now());

end $$
delimiter ;

-- -------------------------------------------------
-- 5. Create a Trigger: Before Delete
delimiter $$

create trigger before_student_delete
before delete on student_info 
for each row

begin

	insert into student_log(action , stud_id , timestamp)
    values ("DELETE" , old.stud_id , now());

end $$

delimiter ;

-- -------------------------------------------------
-- 6. Create a Trigger: After Delete

delimiter $$
create trigger after_student_delete
after delete on student_info 
for each row
begin
	insert into student_archieve (stud_id, stud_code, stud_name, subject, marks, phone, deleted_at)
    values (OLD.stud_id, OLD.stud_code, OLD.stud_name, OLD.subject, OLD.marks, OLD.phone, NOW());

end $$


delimiter ;

-- ----------------------------------------------------




















	