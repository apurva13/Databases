CREATE EXTENSION POSTGIS;
CREATE EXTENSION postgis_topology;

-- Creating a table
CREATE TABLE mapping (name varchar, geom geometry);

-- Inserting the data
INSERT INTO mapping VALUES
	('1179 Home','POINT(-118.28610427653518 34.02858982940724)'),
	('Bing Fountain', 'POINT(-118.28562726267678 34.02225704704248)'),
	('Epstein Plaza', 'POINT(-118.28899150732448 34.0205366957971)'),
	('PFS Fountain', 'POINT(-118.28527959074665 34.02024714279363)'),
	('McClintock Ave', 'POINT(-118.28724971752636 34.02491748164903)'),
	('McCarthy Way', 'POINT(-118.2811607347382 34.0205816945248)'),
	('Watt Way', 'POINT(-118.28892237279248 34.01851818742921)'),
	('Leavey Library', 'POINT(-118.28303407888698 34.021673742713425)'),
	('Doheny Library', 'POINT(-118.28395005326558 34.02034554633695)'),
	('JFF Library', 'POINT(-118.28242061663596 34.01864512820992)'),
	('Panda Express', 'POINT(-118.2864604692397 34.02022556359571)'),
	('Annenberg Cafe', 'POINT(-118.2873164888947 34.02078350023921)'),
	('The Coffee Bean', 'POINT(-118.28647311651777 34.023505382639485)');

--Verifying the data
SELECT name, ST_AsText(geom) FROM mapping;

-- Convex hull

SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM mapping;

--Nearest Neighbors of SAL
SELECT name, ST_Astext(geom) as LOCATION, ST_Distance(geom,'POINT(-118.28610427653518 34.02858982940724)') as DISTANCE 
FROM mapping
WHERE name<>'1179 Home' 
ORDER BY ST_Distance(geom,'POINT(-118.28610427653518 34.02858982940724)') 
limit 4;



