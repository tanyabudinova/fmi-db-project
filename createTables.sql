/* Relational Schemas
Series (id, name, description, trailer_link, poster_url)
Series_Genre (series_id, genre_id)
Episode (number, season_number, series_id, rating, producer name, description, name, length)
Actor(id, name, birthday, image_url)
Actor_Role (actor_id, as_character, episode_number, season_number, series_id)
Review (from, episode_number, season_number, series_id, rating, text)
Genre (id, name)
*/

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
    Description VARCHAR(5000),
    TrailerURL VARCHAR(2048),
    PosterURL VARCHAR(2048)
);

-- Genre (id, name)
CREATE TABLE Genre (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) CONSTRAINT PK_GENRE PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
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
    SeasonNumber INT NOT NULL,
    Rating DOUBLE,
    Description VARCHAR(5000),
    CONSTRAINT PK_EPISODE PRIMARY KEY(SeriesId, Number, SeasonNumber)
);

-- Actor(id, name, birthday, image_url)
CREATE TABLE Actor (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) CONSTRAINT PK_GENRE PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    BirthDate DATE,
    ImageUrl VARCHAR(2048)
);

-- Actor_Role (actor_id, as_character, episode_number, season_number, series_id)
CREATE TABLE Actor_Role (
    ActorId INT NOT NULL CONSTRAINT FK_ROLE_ACTOR REFERENCES Actor(Id),
    SeriesId INT NOT NULL,
    EpisodeNumber INT NOT NULL,
    EpisodeSeason INT NOT NULL,
    AsCharacter VARCHAR(200) NOT NULL,
    CONSTRAINT FK_EPISODE FOREIGN KEY(SeriesId, EpisodeNumber, EpisodeSeason) REFERENCES Episode(SeriesId, Number, SeasonNumber),
    CONSTRAINT PK_ACTS_IN PRIMARY KEY(ActorId, SeriesId, EpisodeNumber, EpisodeSeason, AsCharacter)
);

-- Review (from, episode_number, season_number, series_id, rating, text)
CREATE TABLE Review (
    From VARCHAR(200) NOT NULL,
    Rating SMALLINT NOT NULL,
    Text VARCHAR(5000),
    SeriesId INT NOT NULL,
    EpisodeNumber INT NOT NULL,
    EpisodeSeason INT NOT NULL,
    CONSTRAINT FK_EPISODE FOREIGN KEY(SeriesId, EpisodeNumber, EpisodeSeason) REFERENCES Episode(SeriesId, Number, SeasonNumber),
    CONSTRAINT PK_REVIEW PRIMARY KEY(From, SeriesId, EpisodeNumber, EpisodeSeason)
);
