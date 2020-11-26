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
echo 'executing depcruise...'

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg

cp commit.json $ATOMIST_PUSH
