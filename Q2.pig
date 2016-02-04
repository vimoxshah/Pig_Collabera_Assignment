//Q9A

std = LOAD 'e/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);
a = foreach std generate sname,name,class,marks;
grpc =group a by (class,name,sname);
mark =foreach grpc generate group,SUM(a.marks) as total_marks;
c=filter mark by group.class=='seventh' and group.sname=='DAV'; //change class and schollname according to req.or use parameter sub. 
d = order c by total_marks desc;
e = limit d 1;

-----------------------------------------------------------------
//Q9B

std = LOAD '/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);
a = foreach std generate sname,name,class,marks;
grpc =group a by (class,name,sname);
mark =foreach grpc generate group,SUM(a.marks) as total_marks;
c=filter mark by group.class=='seventh'; //change class acording to req.
d = order c by total_marks desc;
e = limit d 1;


---------------------------------------------------------------
//Q9C
std = LOAD '/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);
a = foreach std generate sname,name,class,marks;
grpc =group a by (sname,name,class);
mark =foreach grpc generate group,SUM(a.marks) as total_marks;
c = filter mark by group.class=='seventh'; //change class according to req.
d = order c by total_marks desc;
f=filter mark by group.sname == 'DAV' and group.class =='seventh';
g= order f by total_marks desc;

-------------------------------------------------------------------
//Q9D
std = LOAD '/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);
a = foreach std generate gender,class,marks;
grpg = group a by (gender,class);
mark = foreach grpg generate group,MAX(SUM(a.marks)) as total_marks;

fltrm = filter mark by group.gender=='M' and group.class=='seventh';//chagne class as per req/
b = foreach fltrm generate total_marks as M;
fltrf = filter mark by group.gender=='F' and group.class=='seventh';
c = foreach fltrf generate total_marks as F;
d = union b,c;

----------------------------------------------------------------------
//Q6

 //For total male and female from all schools;
std = LOAD '/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);
a = foreach std generate sname,gender;

grpc = group a by gender;
b= foreach grpc generate COUNT(a.gender);

//or for each school howmany 'F' and 'M' then do this

grpc = group a by (sname,gender);
b= foreach grpc generate group,COUNT(a.gender);













