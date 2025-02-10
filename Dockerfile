############ BUILD STAGE ############
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml /app/pom.xml
COPY /src /app/src

# Build JAR file
RUN mvn package && \
    cp /app/target/crczp-guacamole-quickconnect-*.jar /app/guacamole-auth-quickconnect-1.3.0.jar

############ RUNNABLE STAGE ############
FROM guacamole/guacamole:1.3.0 AS runnable

WORKDIR /app

COPY --from=build /app/guacamole-auth-quickconnect-1.3.0.jar /opt/guacamole/postgresql/guacamole-auth-quickconnect-1.3.0.jar

RUN apt update && apt install postgresql-client postgresql-client-common -y && /opt/guacamole/bin/initdb.sh --postgres > /srv/initdb.sql
