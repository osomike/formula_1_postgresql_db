FROM flyway/flyway:9.7

COPY ./flyway/schemas/* /flyway/sql/
COPY ./flyway/tables/* /flyway/sql/
COPY ./flyway_entrypoint.sh /flyway/flyway_entrypoint.sh


# https://flywaydb.org/documentation/configuration/parameters/

ENV FLYWAY_USER=dip_admin
ENV FLYWAY_PASSWORD=Digi_rOOt123!
ENV FLYWAY_DEFAULT_SCHEMA=flyway
ENV FLYWAY_CREATE_SCHEMA=true
ENV FLYWAY_SCHEMAS=bronze,silver,gold,flyway

ENV FLYWAY_URL=jdbc:postgresql://dip-analytics-engineer-training-postgresql.postgres.database.azure.com:5432/ae_training
ENV FLYWAY_LOCATIONS=filesystem:/flyway/sql/
ENV FLYWAY_CONNECT_RETRIES=5
ENV FLYWAY_CLEAN_DISABLED=false
ENV FLYWAY_CLEAN=true
ENV FLYWAY_MIGRATE=true

ENTRYPOINT ["bash", "/flyway/flyway_entrypoint.sh" ]
# docker build . -t flyway-db:0.1
# docker run -it --entrypoint bash flyway-db:0.1