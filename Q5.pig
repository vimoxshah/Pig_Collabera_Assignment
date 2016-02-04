IMPORT '/home/vm4learning/Desktop/pig.macro';
movies = load '/home/vm4learning/Desktop/movie.txt' using PigStorage('|') as (id:int,name:chararray,year:int);
old = X(id,name,year);
dump old;
