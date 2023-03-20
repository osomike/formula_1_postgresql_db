CREATE TABLE bronze.sprint_results (
	resultid INTEGER PRIMARY KEY,
	raceid INTEGER,
	driverid INTEGER,
	constructorid INTEGER,
	number INTEGER,
	grid INTEGER,
	position FLOAT,
	positiontext TEXT,
	positionorder INTEGER,
	points INTEGER,
	laps INTEGER,
	time TEXT,
	milliseconds FLOAT,
	fastestlap FLOAT,
	fastestlaptime TEXT,
	statusid INTEGER
);