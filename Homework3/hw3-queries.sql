-- Question 1
select distinct a.id, a.fname, a.lname, c.role, m.name, m.year
from actor a, casts c, movie m,
(select c2.pid, c2.mid
from casts c2
group by c2.pid, c2.mid
having count(distinct c2.role) >= 5) fiverolers
where a.id = c.pid and c.pid = fiverolers.pid and c.mid = m.id and c.mid = fiverolers.mid and m.year = 2010
order by a.lname, a.fname;
-- 137 rows

-- Question 2
select m.year, count(*)
from movie m
where not exists (select * 
from actor a, casts c
where a.id = c.pid and c.mid = m.id and a.gender != 'F')
group by m.year;
-- 129 rows

-- Question 3
select females.year, females.num * 100.00 / allmovies.num, allmovies.num
from (select m.year, count(*) as num
      from movie m
      where not exists (select *
		        from actor a, casts c
                        where a.id = c.pid and c.mid = m.id and a.gender != 'F')
      group by m.year) females,
      (select m.year, count(*) as num
       from movie m
       group by m.year) allmovies
where females.year = allmovies.year
order by females.year;
-- 128 rows

-- Question 4
select m.name, count(distinct c.pid)
from movie m, casts c
where m.id = c.mid
group by m.id, m.name
having not exists (select m2.id
	from movie m2, casts c2
	where m2.id = c2.mid
	group by m2.id
	having count(distinct c2.pid) > count(distinct c.pid));
-- 1 row, 1298 cast members

-- Question 5
select dyears.year, count(*)
from(select distinct year from movie) dyears, movie m
where dyears.year <= m.year and m.year <(dyears.year+10)
group by dyears.year
having not exists(select dyears2.year
		from(select distinct year from movie) dyears2, movie m2
		where dyears2.year <= m2.year and m2.year < (dyears2.year+10)
		group by dyears2.year
		having count(m2.id) > count(m.id));
-- 1 row: year 2000, count 457481

-- Question 6
select count(distinct c2.pid)
from actor a, casts c0, casts c1, casts c2
where a.fname = 'Kevin' and a.lname = 'Bacon'
and a.id = c0.pid
and c0.mid = c1.mid
and c1.mid = c2.mid
and c2.pid not in
(select c4.pid
from actor a2, casts c3, casts c4
where a2.fname = 'Kevin' and a2.lname = 'Bacon'
and a2.id = c3.pid 
and c3.mid = c4.mid);
-- No rows, incorrect query I assume

-- Part C) Using a Cloud Service
-- Fairly cool getting to use (what I assume to be) a professional-level DBMS, and seems like good practice,
-- especially considering what you can get away with doing on SQLite. Offering a DBMS as a service in a public
-- cloud definitely seems useful, but I can imagine that on a larger scale than our class, the servers could be 
-- very taxed, especially if lots of people were using inefficient queries on large sets of data. Otherwise, cool.
