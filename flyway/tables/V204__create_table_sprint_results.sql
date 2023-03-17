CREATE TABLE bronze.sprint_results (
	resultId INTEGER,
	raceId INTEGER,
	driverId INTEGER,
	constructorId INTEGER,
	number INTEGER,
	grid INTEGER,
	position FLOAT,
	positionText TEXT,
	positionOrder INTEGER,
	points INTEGER,
	laps INTEGER,
	time TEXT,
	milliseconds FLOAT,
	fastestLap FLOAT,
	fastestLapTime TEXT,
	statusId INTEGER
)