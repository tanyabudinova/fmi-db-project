DROP VIEW GOOD_SERIES;

--Series that are considered good. Series with rating above 6
CREATE VIEW GOOD_SERIES
AS
    SELECT *
    FROM SERIES
    WHERE FN45454.GET_SERIES_RATING(ID) > 6.0;

SELECT *
FROM GOOD_SERIES;