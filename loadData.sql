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

INSERT INTO SERIES (NAME, DESCRIPTION, TRAILERURL, POSTERURL)
VALUES ('Rick and Morty', 'An animated series that follows the exploits of a super scientist and his not-so-bright grandson.', 'https://imdb-video.media-imdb.com/vi3733110297/1434659607842-pgv4ql-1585752350231.mp4?Expires=1592160468&Signature=rUt-YWj2MXOLPzaoFCZJt9wo6ZSW0I76taqN4mCHYUnYXe5FP7rTJbLZIyVrtbkttnNp2TYQZdWqM9u8DFbEypiguCBOg~SWPrruHRpidrn89QdDKjAQ1QEumGUcFxoCNI~LVaNgwfzbO19XeNqqB6oFeGHzdcpb9wsaJeVjTDQBiag8DXisg1DtMSd8YkM2jM5pH~UUvLUsH1otIti8hfVYtK32OfyNY0n7T2BAsqROHQApXIenTSYQY4rOaG9iB3DmLGHMTwijk7AKdQ4lWeP3Ajag8shBSrWkhihMmPtQNPy0rY7UGjlBX8Vscu0uUsnvZd765j31uUlKvyEALg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA', 'https://m.media-amazon.com/images/M/MV5BMjRiNDRhNGUtMzRkZi00MThlLTg0ZDMtNjc5YzFjYmFjMmM4XkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_.jpg');

INSERT INTO GENRE (NAME)
VALUES ('Animation'), ('Adventure'), ('Comedy');

INSERT INTO SERIES_GENRE (SERIESID, GENREID)
VALUES (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Animation')),
       (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Adventure')),
       (FN45454.GET_SERIES_ID('Rick and Morty'), FN45454.GET_GENRE_ID('Comedy'));


INSERT INTO ACTOR (NAME, BIRTHDATE, IMAGEURL)
VALUES ('Justin Roiland', '1980-02-21', 'https://m.media-amazon.com/images/M/MV5BOTYxMTE5MjY2Nl5BMl5BanBnXkFtZTgwMTM3Mzg3MDI@._V1_SY1000_CR0,0,1502,1000_AL_.jpg'),
       ('Chris Parnell', '1967-02-05', 'https://m.media-amazon.com/images/M/MV5BMTM0NDYzMzU0NF5BMl5BanBnXkFtZTcwOTA3Mjc5Nw@@._V1_SY1000_CR0,0,751,1000_AL_.jpg'),
       ('Spencer Grammer', '1983-10-09', 'https://m.media-amazon.com/images/M/MV5BMTM0NDYzMzU0NF5BMl5BanBnXkFtZTcwOTA3Mjc5Nw@@._V1_SY1000_CR0,0,751,1000_AL_.jpg');

INSERT INTO EPISODE (SERIESID, NAME, PRODUCERNAME, LENGTH, NUMBER, SEASONNUMBER, RATING, DESCRIPTION)
VALUES (GET_SERIES_ID('Rick and Morty'), 'Lawnmower Dog', 'Delna Bhesania', 1320, 2, 1, 0.0, 'Rick helps Jerry out with the dog.'),
       (GET_SERIES_ID('Rick and Morty'), 'A Rickle in Time', 'Delna Bhesania', 1380, 1, 2, 0.0, 'Having restarted time, Rick, Morty and Summer are in a quantum-uncertain state of existence. An argument leads to the creation of two alternate timelines, which need to be stitched back together fast if they are to escape quantum collapse.');

INSERT INTO REVIEW (FROM, RATING, TEXT, SERIESID, EPISODENUMBER, EPISODESEASON)
VALUES ('thetoastermon', 10, 'Comedic science fiction at its best. This episode is a great example of how Rick and Morty breaks ground, especially in its insane writing.', FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2),
       ('screpetis', 8, 'This is a great episode for people who are just starting to watch the series. The violence amount is mediocre, but there is lots of language.', FN45454.GET_SERIES_ID('Rick and Morty'), 1, 2);

