create database school;
use school;
create table student (
roll_no int primary key,
name varchar(50),
mark int,
grade char(1)
);
INSERT INTO STUDENT (Roll_No, Name, mark, Grade) VALUES (1, 'John Doe', '85', 'A');
INSERT INTO STUDENT (Roll_No, Name, mark, Grade) VALUES (2, 'Jane Smith', '75', 'B');
INSERT INTO STUDENT (Roll_No, Name, mark, Grade) VALUES (3, 'Alice Brown', '95', 'A');
select * from student;

alter table student add contact varchar(15);

alter table student drop column grade;

alter table student rename to classten;

select * from classten;

truncate table classten;

drop table classten;