FROM flyway/flyway:9.7

ARG DB_USER
ARG DB_PASSWORD
ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG FLYWAY_CLEAN
ARG FLYWAY_MIGRATE

COPY ./flyway/schemas/* /flyway/sql/
COPY ./flyway/tables/* /flyway/sql/
COPY ./flyway_entrypoint.sh /flyway/flyway_entrypoint.sh


# https://flywaydb.org/documentation/configuration/parameters/

ENV FLYWAY_USER=$DB_USER
ENV FLYWAY_PASSWORD=$DB_PASSWORD
ENV FLYWAY_DEFAULT_SCHEMA=flyway
ENV FLYWAY_CREATE_SCHEMA=true
ENV FLYWAY_SCHEMAS=bronze,silver,gold,flyway

ENV FLYWAY_URL=jdbc:postgresql://$DB_HOST:$DB_PORT/$DB_NAME
ENV FLYWAY_LOCATIONS=filesystem:/flyway/sql/
ENV FLYWAY_CONNECT_RETRIES=3
ENV FLYWAY_CLEAN_DISABLED=false
ENV FLYWAY_CLEAN=$FLYWAY_CLEAN
ENV FLYWAY_MIGRATE=$FLYWAY_MIGRATE

ENTRYPOINT ["bash", "/flyway/flyway_entrypoint.sh" ]
# docker build --build-arg FLYWAY_USER=$(cat creds.txt | grep FLYWAY_USER | cut -d= -f2) --build-arg FLYWAY_PASSWORD=$(cat creds.txt | grep FLYWAY_PASSWORD | cut -d= -f2) . -t flyway-db:0.1
# docker run -it --entrypoint bash flyway-db:0.1
# docker run flyway-db:0.1