std = LOAD '/home/vm4learning/Desktop/s.txt' using PigStorage('|') AS (rno:int,sname:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,marks:int);

a = foreach std generate sname,gender;
b= filter a by gender=='$X';
grpc = group b by (sname,gender);
describe grpc;
dump grpc;
c= foreach grpc generate group,COUNT($1);
dump c;



