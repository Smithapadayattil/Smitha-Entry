create database School;
use School;
create table STUDENTS(
Roll_No int primary key,
Nam varchar(50) not null,
Marks int,
Grade varchar(15)
);
insert into STUDENTS values(
1, "Anitha", 48, "A",
2, "Alex" , 25, "C" ,
3, "Cyril", 32, "B",
4, "Ben", 19, "D",
5, "Frank", 33, "B");
select * from STUDENTS;






