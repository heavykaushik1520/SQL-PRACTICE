use t201;
select * from student;

call getAllStudents();

show procedure status where db="t201";

call getStudentCount();

call getStudentById(1);

call returnStudentCount(@count);

select @count;

call inAndOut('pune' , @count);

select @count ;

call conditionalSP(2);

call loopSP();

show tables;

use t201;

select sum_1_to_5();