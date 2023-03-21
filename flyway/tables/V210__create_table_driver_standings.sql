CREATE TABLE bronze.driver_standings (
	driverstandingsid INTEGER PRIMARY KEY,
	raceid INTEGER,
	driverid INTEGER,
	points FLOAT,
	position INTEGER,
	positiontext TEXT,
	wins INTEGER
);