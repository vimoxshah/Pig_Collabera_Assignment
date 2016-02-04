//Q10 A

movies =  load '/home/vm4learning/Desktop/movie.txt' using PigStorage('|') as (id:int,name:chararray,year:int);
filter_year = filter movies by year!=0;
year_order = order filter_year by year;
grp_year = group year_order by year; 
minyr = foreach grp_year generate MIN(year_order.year),year_order.name;
oldest = limit minyr 1;
dump oldest;

-------------------------------------------------

//Q10 C
mvirating = LOAD '/home/vm4learning/Desktop/data.txt' using PigStorage('|') AS (id:int,mid:int,rating:int);  
flter = filter mvirating by id !=0 or mid!=0;     
id = foreach flter generate id;
dst= DISTINCT id;
grp_id = group dst all;
nu = foreach grp_id generate COUNT(dst);

---------------------------------------------------

//Q10 C(ii)D
mvirating = LOAD '/home/vm4learning/Desktop/mvirating.txt' using PigStorage('|') AS (id:int,mid:int,rating:int);  

flter = filter mvirating by id !=0 or mid!=0 or rating!=0; 

mr = foreach flter generate mid,rating;  
grp = group mr by mid;
avgr = foreach grp generate group ,AVG(mr.rating) as rat;//uptp here for Q10 C(ii) 
grpavg = group avgr all; 
top3 = foreach grpavg generate TOP(3,1,avgr); 
------------
//or else  
top = order avgr by rat desc;  
top3 = limit top 3;





