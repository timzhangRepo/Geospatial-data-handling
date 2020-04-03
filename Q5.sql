CREATE EXTENSION postgis;

CREATE TABLE coordinate(
    name VARCHAR(50),
    points geometry
);

SELECT * from coordinate;

Insert into coordinate (name, points)
VALUES ('Tutor Hall Café', ST_GeomFromText('POINT(-118.290004 34.020236)', 4326));
Insert into coordinate (name, points)
VALUES ('Starbucks (Leavy)',ST_GeomFromText('POINT(-118.282118 34.021836)', 4326));
Insert into coordinate (name, points)
VALUES ('Literatea Café',ST_GeomFromText('POINT(-118.283084 34.020325)', 4326));
Insert into coordinate (name, points)
VALUES ('Cammereli Café',ST_GeomFromText('POINT(-118.283116 34.019258)', 4326));
Insert into coordinate (name, points)
VALUES ('Fertitta Café',ST_GeomFromText('POINT(-118.281925 34.018919)', 4326));

Insert into coordinate (name, points)
VALUES ('Leavy Library',ST_GeomFromText('POINT(-118.282107 34.021981)', 4326));
Insert into coordinate (name, points)
VALUES ('Laufer Library',ST_GeomFromText('POINT(-118.287099 34.020261)', 4326));
Insert into coordinate (name, points)
VALUES ('Wilson Dental Library',ST_GeomFromText('POINT(-118.284834 34.024275)', 4326));
Insert into coordinate (name, points)
VALUES ('Hoosen Library of Philosophy',ST_GeomFromText('POINT(-118.28657 34.018912)', 4326));
Insert into coordinate (name, points)
VALUES ('Ethel Percy Andrus Gerontology Library',ST_GeomFromText('POINT(-118.290829 34.02025)', 4326));

Insert into coordinate (name, points)
VALUES ('USC Parking Lot 49',ST_GeomFromText('POINT(-118.287542 34.026343)', 4326));
Insert into coordinate (name, points)
VALUES ('USC parking lot 42',ST_GeomFromText('POINT(-118.285224 34.027428)', 4326));
Insert into coordinate (name, points)
VALUES ('USC Village Parking Garage',ST_GeomFromText('POINT(-118.283336 34.025774)', 4326));
Insert into coordinate (name, points)
VALUES ('USC Shrine Parking Structure',ST_GeomFromText('POINT(-118.279216 34.024316)', 4326));
Insert into coordinate (name, points)
VALUES ('Grand Avenue Structure',ST_GeomFromText('POINT(-118.275633 34.020403)', 4326));


SELECT * from coordinate;
/*Convex hull*/
Select st_astext(ST_ConcaveHull(ST_Collect(points::geometry),1)) As polygon
FROM coordinate;

/*four nearest points to Laufer Library */
SELECT *
FROM coordinate
ORDER BY points <-> st_setsrid(st_makepoint(-118.287099,34.020261),4326)
LIMIT 5 ;

