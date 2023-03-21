
# F1 Dataset Flyway Migration
This repository contains a Flyway migration for a PostgreSQL database, which creates the necessary schemas and tables
to upload an F1 dataset. The migration can be run either locally using docker run, or via a GitHub Actions workflow
triggered by a dispatch event.

## Getting Started

### Run the migration locally
To run the Flyway migration locally, you'll need Docker installed on your machine.
Then, simply run the following commands.

To build run:
```
docker build \
--build-arg DB_USER=<db-username> \
--build-arg DB_PASSWORD=<db-password> \
--build-arg DB_HOST=<db-host> \
--build-arg DB_PORT=<db-port> \
--build-arg DB_NAME=<db-name> \
--build-arg FLYWAY_CLEAN=true \
--build-arg FLYWAY_MIGRATE=true \
. -t <docker-image-name>:<docker-image-version>
```
To run the image run:
```
docker run <docker-image-name>:<docker-image-version>
```

### Run the migration via github workflows
To run the migration via GitHub Actions, you can trigger the ```flyway-migrate``` workflow by creating a dispatch event.
To do this, navigate to the **"Actions"** tab in your repository and click **"Run workflow"** > **"Flyway Migrate"** >
**"Run workflow"**. You can then select if you want to perform a ```clean``` operation before migrating by checking the
```flyway-clean``` option.

## F1 Dataset
The [Formula 1 World Championship (1950 - 2023)](https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)  used by this migration was sourced from Kaggle. It contains data on every driver, constructor,
and circuit in Formula 1 history, including lap times, results, and other statistics.