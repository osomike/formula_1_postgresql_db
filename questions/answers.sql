------------------------------------------------------------------------------------------------------------------------
-- 1	What was the line-up for 2022? which drivers were racing for which team?
WITH races_target AS (
    SELECT
        raceid,
        year
    FROM
        bronze.races
    WHERE
        races.year = 2022
        ),

results_target AS (
    SELECT
        races_target.raceid,
        races_target.year,
        results.driverid,
        results.constructorid
    FROM
        races_target JOIN bronze.results ON races_target.raceid = bronze.results.raceid
        ),

results_target_with_driver AS (
    SELECT
        results_target.raceid,
        results_target.year,
        results_target.constructorid,
        drivers.forename,
        drivers.surname
    FROM
        results_target JOIN bronze.drivers ON results_target.driverid = drivers.driverid
        ),

results_target_complete AS (
    SELECT
        results_target_with_driver.raceid,
        results_target_with_driver.year,
        results_target_with_driver.forename,
        results_target_with_driver.surname,
        constructors.name
    FROM
        results_target_with_driver JOIN bronze.constructors ON results_target_with_driver.constructorid = constructors.constructorid
        )

SELECT DISTINCT name, forename, surname, year
FROM results_target_complete
ORDER BY name

------------------------------------------------------------------------------------------------------------------------
-- 2 Which players won most times (1st position) during the season of 2022? An ordered table would be easier to read.
WITH races_target AS (
    SELECT
        raceid,
        year
    FROM bronze.races
    WHERE races.year = 2022
    ),

results_target AS (
    SELECT
        races_target.raceid,
        races_target.year,
        results.driverid,
        results.constructorid,
        results.position
    FROM
        races_target JOIN bronze.results ON races_target.raceid = bronze.results.raceid
    ),

results_target_with_driver AS (
    SELECT
        results_target.raceid,
        results_target.year,
        results_target.constructorid,
        results_target.position,
        drivers.forename,
        drivers.surname
    FROM
        results_target JOIN bronze.drivers ON results_target.driverid = drivers.driverid
    ),

results_target_complete AS (
    SELECT
        results_target_with_driver.raceid,
        results_target_with_driver.year,
        results_target_with_driver.forename,
        results_target_with_driver.surname,
        results_target_with_driver.position,
        constructors.name
    FROM results_target_with_driver JOIN bronze.constructors ON results_target_with_driver.constructorid = constructors.constructorid
    )

SELECT forename, surname, name, count(position) AS wins
FROM results_target_complete
WHERE position = 1
GROUP BY forename, surname, name
ORDER BY  count(position) DESC

------------------------------------------------------------------------------------------------------------------------
-- 3 Which players ended up in podium positions the most during the season of 2022? An ordered table would be
-- easier to read.
WITH races_target AS (
    SELECT
        raceid,
        year
    FROM bronze.races
    WHERE races.year = 2022
    ),

results_target AS (
    SELECT
        races_target.raceid,
        races_target.year,
        results.driverid,
        results.constructorid,
        results.position
    FROM
        races_target JOIN bronze.results ON races_target.raceid = bronze.results.raceid
    ),

results_target_with_driver AS (
    SELECT
        results_target.raceid,
        results_target.year,
        results_target.constructorid,
        results_target.position,
        drivers.forename,
        drivers.surname
    FROM
        results_target JOIN bronze.drivers ON results_target.driverid = drivers.driverid
    ),

results_target_complete AS (
    SELECT
        results_target_with_driver.raceid,
        results_target_with_driver.year,
        results_target_with_driver.forename,
        results_target_with_driver.surname,
        results_target_with_driver.position,
        constructors.name
    FROM results_target_with_driver JOIN bronze.constructors ON results_target_with_driver.constructorid = constructors.constructorid
    )

SELECT forename, surname, name, count(position) AS wins
FROM results_target_complete
WHERE position IN (1, 2, 3)
GROUP BY forename, surname, name
ORDER BY  count(position) DESC