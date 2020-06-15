DROP FUNCTION GET_ACTOR_ID;
DROP FUNCTION GET_GENRE_ID;
DROP FUNCTION GET_SERIES_ID;

-- Helper functions for inserting
CREATE FUNCTION GET_SERIES_ID(SNAME VARCHAR(150))
    RETURNS INT
    RETURN
        SELECT ID
        FROM SERIES
        WHERE NAME = SNAME;

CREATE FUNCTION GET_GENRE_ID(GNAME VARCHAR(50))
    RETURNS INT
    RETURN
        SELECT ID
        FROM GENRE
        WHERE NAME = GNAME;

CREATE FUNCTION GET_ACTOR_ID(ANAME VARCHAR(50))
    RETURNS INT
    RETURN
        SELECT ID
        FROM ACTOR
        WHERE NAME = ANAME;

INSERT INTO SERIES (NAME, DESCRIPTION, TRAILERURL, POSTERURL)
VALUES ('Rick and Morty', 'An animated series that follows the exploits of a super scientist and his not-so-bright grandson.', 'WNhH00OIPP0', 'm.media-amazon.com/images/M/MV5BMjRiNDRhNGUtMzRkZi00MThlLTg0ZDMtNjc5YzFjYmFjMmM4XkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_.jpg');

INSERT INTO GENRE (NAME)
VALUES ('Animation'), ('Adventure'), ('Comedy');

INSERT INTO SERIES_GENRE (SERIESID, GENREID)
VALUES (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Animation')),
       (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Adventure')),
       (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Comedy'));


INSERT INTO ACTOR (NAME, BIRTHDATE, IMAGEURL)
VALUES ('Justin Roiland', '1980-02-21', 'm.media-amazon.com/images/M/MV5BOTYxMTE5MjY2Nl5BMl5BanBnXkFtZTgwMTM3Mzg3MDI@._V1_SY1000_CR0,0,1502,1000_AL_.jpg'),
       ('Chris Parnell', '1967-02-05', 'm.media-amazon.com/images/M/MV5BMTM0NDYzMzU0NF5BMl5BanBnXkFtZTcwOTA3Mjc5Nw@@._V1_SY1000_CR0,0,751,1000_AL_.jpg'),
       ('Spencer Grammer', '1983-10-09', 'm.media-amazon.com/images/M/MV5BMTM0NDYzMzU0NF5BMl5BanBnXkFtZTcwOTA3Mjc5Nw@@._V1_SY1000_CR0,0,751,1000_AL_.jpg');

INSERT INTO EPISODE (SERIESID, NAME, PRODUCERNAME, LENGTH, NUMBER, SEASONNUMBER, RATING, DESCRIPTION)
VALUES (FN45454.GET_SERIES_ID('Rick and Morty'), 'Lawnmower Dog', 'Delna Bhesania', 1320, 2, 1, 0.0, 'Rick helps Jerry out with the dog.'),
       (FN45454.GET_SERIES_ID('Rick and Morty'), 'A Rickle in Time', 'Delna Bhesania', 1380, 1, 2, 0.0, 'Having restarted time, Rick, Morty and Summer are in a quantum-uncertain state of existence. An argument leads to the creation of two alternate timelines, which need to be stitched back together fast if they are to escape quantum collapse.');

INSERT INTO ACTOR_ROLE (ACTORID, SERIESID, EPISODENUMBER, EPISODESEASON, ASCHARACTER)
VALUES (FN45454.GET_ACTOR_ID('Justin Roiland'), FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2, 'Rick'),
       (FN45454.GET_ACTOR_ID('Justin Roiland'), FN45454.GET_SERIES_ID('Rick and Morty'), 2, 1, 'Rick'),
       (FN45454.GET_ACTOR_ID('Justin Roiland'), FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2, 'Morty'),
       (FN45454.GET_ACTOR_ID('Justin Roiland'), FN45454.GET_SERIES_ID('Rick and Morty'), 2, 1, 'Morty'),
       (FN45454.GET_ACTOR_ID('Chris Parnell'), FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2, 'Jerry'),
       (FN45454.GET_ACTOR_ID('Chris Parnell'), FN45454.GET_SERIES_ID('Rick and Morty'), 2, 1, 'Jerry'),
       (FN45454.GET_ACTOR_ID('Spencer Grammer'), FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2, 'Summer'),
       (FN45454.GET_ACTOR_ID('Spencer Grammer'), FN45454.GET_SERIES_ID('Rick and Morty'), 2, 1, 'Summer');

INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON)
VALUES ('thetoastermon', 10, 'Comedic science fiction at its best. This episode is a great example of how Rick and Morty breaks ground, especially in its insane writing.', FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2);

INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON)
VALUES       ('screpetis', 8, 'This is a great episode for people who are just starting to watch the series. The violence amount is mediocre, but there is lots of language.', FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2);


INSERT INTO SERIES (NAME, DESCRIPTION, TRAILERURL, POSTERURL)
VALUES ('Gravity Falls', 'Twin siblings Dipper and Mabel Pines spend the summer at their great-uncle''s tourist trap in the enigmatic Gravity Falls, Oregon.',
        '0PYzpK-xa6c',
        'm.media-amazon.com/images/M/MV5BMTEzNDc3MDQ2NzNeQTJeQWpwZ15BbWU4MDYzMzUwMDIx._V1_SY1000_CR0,0,641,1000_AL_.jpg');

INSERT INTO GENRE (NAME) VALUES ('Action');

INSERT INTO SERIES_GENRE (SERIESID, GENREID)
VALUES (FN45454.GET_SERIES_ID('Gravity Falls'), FN45454.GET_GENRE_ID('Animation')),
       (FN45454.GET_SERIES_ID('Gravity Falls'), FN45454.GET_GENRE_ID('Adventure')),
       (FN45454.GET_SERIES_ID('Gravity Falls'), FN45454.GET_GENRE_ID('Action'));

INSERT INTO EPISODE (SERIESID, NAME, PRODUCERNAME, LENGTH, NUMBER, SEASONNUMBER, RATING, DESCRIPTION)
VALUES (FN45454.GET_SERIES_ID('Gravity Falls'), 'Tourist Trapped', 'Alex Hirsch', 1320, 1, 1, 0.0,
       'After finding a strange book in the forest, Dipper begins to learn about the dark side of Gravity Falls, and suspects that Mabel''s new boyfriend is a zombie.');

INSERT INTO ACTOR (NAME, BIRTHDATE, IMAGEURL) VALUES ('Kristen Schaal', '1978-01-24', 'm.media-amazon.com/images/M/MV5BMTIxNzAzNzUwM15BMl5BanBnXkFyZXN1bWU@._V1_.jpg');
INSERT INTO ACTOR (NAME, BIRTHDATE, IMAGEURL) VALUES ('Jason Ritter', '1980-02-17', 'm.media-amazon.com/images/M/MV5BMTMzODA1NzMyOF5BMl5BanBnXkFtZTcwMTI5MDEyNg@@._V1_.jpg');
INSERT INTO ACTOR (NAME, BIRTHDATE, IMAGEURL) VALUES ('Alex Hirsch', '1985-06-18', 'm.media-amazon.com/images/M/MV5BNTgyNjhlMmQtNGZjMi00MjE1LTg5MDEtOTRkOTU0NzY1MWEyXkEyXkFqcGdeQXVyOTYwMjczODY@._V1_.jpg');

INSERT INTO EPISODE (SERIESID, NAME, PRODUCERNAME, LENGTH, NUMBER, SEASONNUMBER, RATING, DESCRIPTION)
 VALUES (FN45454.GET_SERIES_ID('Gravity Falls'), 'Scary-oke ', 'Alex Hirsch', 1380, 1, 2, 0.0,
         'The Pines Family resolves to get back to normal by throwing a "Mystery Shack is Back" party ... but nothing is normal in Gravity Falls!');

INSERT INTO ACTOR_ROLE (ACTORID, SERIESID, EPISODENUMBER, EPISODESEASON, ASCHARACTER)
VALUES (FN45454.GET_ACTOR_ID('Kristen Schaal'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1, 'Mable'),
       (FN45454.GET_ACTOR_ID('Kristen Schaal'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 2, 'Mable'),
       (FN45454.GET_ACTOR_ID('Jason Ritter'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1, 'Dipper'),
       (FN45454.GET_ACTOR_ID('Jason Ritter'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 2, 'Dipper'),
       (FN45454.GET_ACTOR_ID('Alex Hirsch'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1, 'Gruncle Stan'),
       (FN45454.GET_ACTOR_ID('Alex Hirsch'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 2, 'Gruncle Stan'),
       (FN45454.GET_ACTOR_ID('Alex Hirsch'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1, 'Soos'),
       (FN45454.GET_ACTOR_ID('Alex Hirsch'), FN45454.GET_SERIES_ID('Gravity Falls'), 1, 2, 'Soos');

INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON) VALUES ('Edvis-1997', 7, 'I''m not a fan of hearing how characters are singing in cartoons...', FN45454.GET_SERIES_ID('Gravity Falls'), 1, 2);
INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON) VALUES ('ivyleague929', 8, 'I don''t think you understand the gravity of the situation. I was really hooked after the first episode. This show is really worth grappling.', FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1);
INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON) VALUES ('Edvis-1997', 9, 'I''m very disappointing in myself because I saw this TV series only now. First episode was brilliant, funny,interesting plenty of action. One of the best TV series ever.', FN45454.GET_SERIES_ID('Gravity Falls'), 1, 1);

SELECT * FROM REVIEW;

-- Series rating function
-- Actor series count function
-- Review rating limiter trigger
-- Episode rating calculator trigger
-- Series by genre function
-- Good series view with rating above N
-- Series which have more than N reviews

