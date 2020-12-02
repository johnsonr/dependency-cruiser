FROM node:14.4.0

RUN apt-get -y update \
    && apt-get install -y graphviz \
    && apt-get install tree \
    && apt-get install -y jq

# Install transpilers
RUN npm install --global typescript
RUN npm install --global coffeescript
RUN npm install --global livescript

RUN npm install --global dependency-cruiser

WORKDIR /skill

# COPY commit.json .
COPY run.sh .
COPY .dependency-cruiser.js .

ENTRYPOINT ["/skill/run.sh"]
