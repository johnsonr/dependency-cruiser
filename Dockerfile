FROM node:14.4.0@sha256:719d5524c7e927c2c3e49338c7dde7fe56cb5fdb3566cdaba5b37cc05ddf15da

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
