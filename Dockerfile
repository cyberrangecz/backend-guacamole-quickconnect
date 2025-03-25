# Copyright (c) 2020 MASARYK UNIVERSITY
# Copyright (c) 2024 CyberSecurity Hub, z.s.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

############ BUILD STAGE ############
FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml /app/pom.xml
COPY /src /app/src

# Build JAR file
RUN mvn package -Drat.skip=true && \
    cp /app/target/crczp-guacamole-quickconnect-*.jar /app/guacamole-auth-quickconnect-1.3.0.jar

############ RUNNABLE STAGE ############
FROM guacamole/guacamole:1.3.0 AS runnable

WORKDIR /app

COPY --from=build /app/guacamole-auth-quickconnect-1.3.0.jar /opt/guacamole/postgresql/guacamole-auth-quickconnect-1.3.0.jar

RUN apt update && apt install postgresql-client postgresql-client-common -y && /opt/guacamole/bin/initdb.sh --postgres > /srv/initdb.sql
