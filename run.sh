#!/bin/bash

set -o pipefail

cp commit.json $ATOMIST_OUTPUT_DIR/push.json

cd /atm/home

# TODO exit 0 on not having package.json

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg
