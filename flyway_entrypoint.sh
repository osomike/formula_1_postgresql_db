#!/bin/bash

echo "Starting flyway migration..."

if [[ $FLYWAY_CLEAN = true ]]; then
     echo "applying flyway clean..."
     flyway clean
fi

if [[ $FLYWAY_MIGRATE = true ]]; then
     echo "applying flyway migrate.."
     flyway migrate

fi
echo "flyway migration finished"
