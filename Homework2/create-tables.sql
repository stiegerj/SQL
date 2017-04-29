create table actor(id int primary key, fname varchar(30), lname varchar(30), gender varchar(1));
.import imdb2010-ascii/IMDB/actor-ascii.txt actor
create table movie(id int primary key, name varchar(150), year int);
create table directors(id int primary key, fname varchar(30), lname varchar(30));
.import imdb2010-ascii/IMDB/movie-ascii.txt movie
.import imdb2010-ascii/IMDB/directors-ascii.txt directors
create table casts(pid int references actor, mid int references movie, role varchar(50));
.import imdb2010-ascii/IMDB/casts-ascii.txt casts
create table movie_directors(did int references directors, mid int references movie);
.import imdb2010-ascii/IMDB/movie_directors-ascii.txt movie_directors
create table genre(mid int references movie, genre varchar(50));
.import imdb2010-ascii/IMDB/genre-ascii.txt genre
