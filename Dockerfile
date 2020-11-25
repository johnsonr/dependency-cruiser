FROM node:lts

# replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get -y update \
    && apt-get install -y graphviz

RUN npm install --global dependency-cruiser

WORKDIR /skill

# COPY /target/spring-format-0.1.0-SNAPSHOT-jar-with-dependencies.jar .
COPY commit.json .
COPY run.sh .

ENTRYPOINT ["/skill/run.sh"]
