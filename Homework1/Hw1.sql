--Jessie Stieger
--CSE 414 Homework 1

.nullvalue NULL

-- 1a
create table r
(a int, b int);

--1b
insert into r values (2,4);
insert into r values (1,1);
insert into r values (3,2);

--1c
select * from r;

--1d
insert into r values ('5','2');
-- No error because sqlite turns strings to ints whenever possible.

--1e
select a from r;

--1f
select * from r
where a <= b;

--2
create table MyRestaurants
(name varchar(20),type varchar(20),distance int, last_visit varchar(20), like int);

--3
insert into MyRestaurants values ('Subway','Subs',7,'2013-04-02',1);
insert into MyRestaurants values ('Memos','Mexican',75,'2011-08-15',0);
insert into MyRestaurants values ('Jack in the Box','Fast food',6,'2013-02-21',null);
insert into MyRestaurants values ('Teds Montana Grill','Burgers',283,'2013-03-28',1);
insert into MyRestaurants values ('Wendys','Fast food',17,'2014-01-08',1);

--4
select * from MyRestaurants;

--5a
.mode csv
select * from MyRestaurants;

--5b
.mode list
.separator '|'
select * from MyRestaurants;

--5c
.mode column
.width 15
select * from MyRestaurants;

--5d
.header off
select * from MyRestaurants;
.header on
select * from MyRestaurants;

--6
create table temp
as select * from MyRestaurants;
update temp
set like = replace(like,'1','I liked it');
update temp
set like = replace(like,'0','I hated it');
select * from temp;

--7
select * from myRestaurants
where like=1 and date('now','-3 month') > date(myRestaurants.last_visit);





