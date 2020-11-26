#!/bin/bash

set -o pipefail

cp commit.json $ATOMIST_PUSH

cd /atm/home

if [[ ! -f package.json ]] ; then
    echo 'No package.json: nothing to do'
    exit 0
fi

pwd
ls
echo 'executing depcruise...'

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg
