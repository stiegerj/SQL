-- Question 1
select fname, lname
from casts, actor, movie
where name = 'Officer 444' and mid = movie.id and pid = actor.id;
-- 13 rows

-- Question 2
select d.fname, d.lname, m.name, m.year
from directors d, movie m, movie_directors md, genre g
where md.did = d.id and md.mid = m.id and g.mid = m.id and genre = 'Film-Noir' and m.year%4 = 0;
-- 113 rows

-- Question 3
select a.fname, a.lname
from actor a, movie m1, movie m2, casts c1, casts c2
where a.id = c1.pid and a.id = c2.pid and m1.id = c1.mid and m2.id = c2.mid 
and m1.year < 1900 and m2.year > 2000
group by a.fname, a.lname;
-- These appear to be historically or otherwise important real-life people portraying themselves in movies.

-- Question 4
select fname, lname, count(*)
from directors, movie_directors
where did=id
group by fname,lname,did
having count(*) > 500
order by count(*) desc;
-- 47 rows

-- Question 5
select a.fname, a.lname, m.name, count(c.role) as Roles
from actor a, movie m, casts c
where c.pid = a.id and c.mid = m.id and m.year = 2010
group by a.fname, a.lname, m.name, c.pid
having count(c.role) > 5;
-- 11 rows