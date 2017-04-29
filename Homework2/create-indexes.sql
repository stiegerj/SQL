-- In order to speed up Questions 1,2, and 5
create index moviename on movie(name);

-- In order to speed up Questions 2 and 4
create index directornames on directors(fname,lname);

-- In order to speed up Questions 1,3, and 5
create index actornames on actor(fname,lname);

-- In order to speed up the selections on Questions 2 and 3
create index movieyear on movie(year);

-- In order to speed up Question 5
create index castroles on casts(role);

-- In order to speed up the join in Question 2
create index genres on genre(genre);

-- In order to speed up the joins in Questions 1,3, and 5
create index actorid on actor(id);

-- In order to speed up the joins in Questions 2 and 4
create index directorid on directors(id);

-- In order to speed up the joins in Questions 1,2,3, and 5
create index movieid on movie(id);
