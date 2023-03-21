CREATE TABLE bronze.constructor_standings (
	constructorstandingsid INTEGER PRIMARY KEY,
	raceid INTEGER,
	constructorid INTEGER,
	points FLOAT,
	position INTEGER,
	positiontext TEXT,
	wins INTEGER
);