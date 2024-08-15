FROM openjdk:17-slim

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y wget unzip

ENV VERSION 1.0.7075
ENV POSTGRES_VERSION 42.7.3

RUN wget https://datomic-pro-downloads.s3.amazonaws.com/$VERSION/datomic-pro-$VERSION.zip -O datomic-pro-$VERSION.zip

RUN unzip datomic-pro-${VERSION}.zip
RUN mv datomic-pro-${VERSION} datomic
RUN rm datomic-pro-${VERSION}.zip

WORKDIR /opt/datomic

# Remove old postgres dependency and replace it
RUN rm lib/postgresql-*.jar
RUN wget https://repo1.maven.org/maven2/org/postgresql/postgresql/$POSTGRES_VERSION/postgresql-$POSTGRES_VERSION.jar -O lib/postgresql-$POSTGRES_VERSION.jar

COPY postgres-transactor.properties .

EXPOSE 4334

CMD ["bin/transactor", "-Xms4g", "-Xmx4g", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=50", "postgres-transactor.properties"]
