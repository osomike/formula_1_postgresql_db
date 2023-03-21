
ALTER TABLE bronze.races ADD CONSTRAINT fk_races_circuitid FOREIGN KEY (circuitid) REFERENCES bronze.circuits(circuitid);
ALTER TABLE bronze.races ADD CONSTRAINT fk_races_year FOREIGN KEY (year) REFERENCES bronze.seasons(year);

ALTER TABLE bronze.sprint_results ADD CONSTRAINT fk_sprint_results_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.sprint_results ADD CONSTRAINT fk_sprint_results_driverid FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);
ALTER TABLE bronze.sprint_results ADD CONSTRAINT fk_sprint_results_statusid FOREIGN KEY (statusid) REFERENCES bronze.status(statusid);

ALTER TABLE bronze.constructor_standings ADD CONSTRAINT fk_constructor_standings_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.constructor_standings ADD CONSTRAINT fk_constructor_standings_constructorid FOREIGN KEY (constructorid) REFERENCES bronze.constructors(constructorid);

ALTER TABLE bronze.driver_standings ADD CONSTRAINT fk_driver_standings_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.driver_standings ADD CONSTRAINT fk_driver_standings FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);

ALTER TABLE bronze.qualifying ADD CONSTRAINT fk_qualifying_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.qualifying ADD CONSTRAINT fk_qualifying_driverid FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);
ALTER TABLE bronze.qualifying ADD CONSTRAINT fk_qualifying_constructorid FOREIGN KEY (constructorid) REFERENCES bronze.constructors(constructorid);

ALTER TABLE bronze.results ADD CONSTRAINT fk_results_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.results ADD CONSTRAINT fk_results_driverid FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);
ALTER TABLE bronze.results ADD CONSTRAINT fk_results_constructorid FOREIGN KEY (constructorid) REFERENCES bronze.constructors(constructorid);
ALTER TABLE bronze.results ADD CONSTRAINT fk_results_statusid FOREIGN KEY (statusid) REFERENCES bronze.status(statusid);

ALTER TABLE bronze.constructor_results ADD CONSTRAINT fk_constructor_results_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.constructor_results ADD CONSTRAINT fk_constructor_results_constructorid FOREIGN KEY (constructorid) REFERENCES bronze.constructors(constructorid);

ALTER TABLE bronze.pit_stops ADD CONSTRAINT fk_pit_stops_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.pit_stops ADD CONSTRAINT fk_pit_stops_driverid FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);

ALTER TABLE bronze.lap_times ADD CONSTRAINT fk_lap_times_raceid FOREIGN KEY (raceid) REFERENCES bronze.races(raceid);
ALTER TABLE bronze.lap_times ADD CONSTRAINT fk_lap_times_driverid FOREIGN KEY (driverid) REFERENCES bronze.drivers(driverid);




