#!/bin/bash

set -o pipefail

cd /atm/home

if [[ ! -f package.json ]] ; then
    echo 'No package.json: nothing to do'
    pwd
    echo 'listing...'
    ls
    exit 0
fi

pwd
ls -a
echo 'executing dependency-cruiser...'

cp /skill/.dependency-cruiser.js .

depcruise --info

# Show what we have to the log
depcruise --progress cli-feedback --include-only "^src" --output-type dot src

# Hangs
# depcruise -v -T dot src | dot -T svg | depcruise-wrap-stream-in-html > dependency-graph.html

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg

cp /skill/commit.json $ATOMIST_OUTPUT_DIR/push.json