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
ls
echo 'executing dependency-cruiser...'

tree src

cp /skill/.dependency-cruiser.js .

# Show what we have to the log
depcruise --include-only "^src" --output-type dot src

# depcruise -v -T dot src | dot -T svg | depcruise-wrap-stream-in-html > dependency-graph.html

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg

cp commit.json $ATOMIST_PUSH
