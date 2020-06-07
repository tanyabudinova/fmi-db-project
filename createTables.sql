/* Relational Schemas
Series (id, name, description, trailer_link, poster_url)
Series_Genre (series_id, genre_id)
Episode (number, season_number, series_id, rating, producer name, description, name, length)
Actor(id, name, birthday, image_url)
Actor_Role (actor_id, as_characher, episode_number, season_number, series_id)
Review (from, episode_number, season_number, series_id, rating, text)
Genre (id, name)
*/

SET SCHEMA DB2LIB;

DROP TABLE Series;
DROP TABLE Series_Genre;
DROP TABLE Episode;
DROP TABLE Actor;
DROP TABLE Actor_Role;
DROP TABLE Review;
DROP TABLE Genre;

--Series (id, name, description, trailer_link, poster_url)
CREATE TABLE Series(
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) CONSTRAINT PK_SERIES PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Description VARCHAR(300),
    TrailerURL VARCHAR(2048),
    PosterURL VARCHAR(2048)
);

--Series_Genre (series_id, genre_id)
CREATE TABLE Series_Genre(
    SeriesId INT NOT NULL CONSTRAINT FK_SERIES REFERENCES Series(Id),
    GenreId INT NOT NULL CONSTRAINT FK_GENRE REFERENCES Genre(Id),
    CONSTRAINT PK_SER_GEN PRIMARY KEY(SeriesId, GenreId)
);

--Episode (number, season_number, series_id, rating, producer name, description, name, length)
CREATE TABLE Episode(
    SeriesId INT NOT NULL CONSTRAINT FK_SERIES REFERENCES Series(Id),
    Name VARCHAR(150) NOT NULL,
    ProducerName VARCHAR(200),
    Length INT,
    Number INT NOT NULL,
    SeasonNumber INT NOT NULL ,
    Rating DOUBLE,
    Description VARCHAR(300),
    CONSTRAINT PK_EPISODE PRIMARY KEY(SeriesId, Number, SeasonNumber)
);