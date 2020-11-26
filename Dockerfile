FROM node:14.4.0

RUN apt-get -y update \
    && apt-get install -y graphviz \
    && apt-get install tree

RUN npm install --global dependency-cruiser

WORKDIR /skill

COPY commit.json .
COPY run.sh .
COPY .dependency-cruiser.js .

ENTRYPOINT ["/skill/run.sh"]
