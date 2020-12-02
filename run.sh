#!/bin/bash

set -o pipefail

GRAPHIC=dependencygraph.svg

cd /atm/home

if [[ ! -f package.json ]] ; then
    echo 'No package.json: nothing to do'
    pwd
    echo 'listing...'
    ls
    exit 0
fi

# Debug
# pwd
# ls -a

echo 'executing dependency-cruiser...'

cp /skill/.dependency-cruiser.js .

# Uncomment for more verbose logging
# depcruise --info

# Show what we have to the log
depcruise --progress cli-feedback --include-only "^src" --output-type dot src

# Hangs
# depcruise -v -T dot src | dot -T svg | depcruise-wrap-stream-in-html > dependency-graph.html

depcruise --include-only "^src" --output-type dot src | dot -T svg > $GRAPHIC

# cp commit.json $ATOMIST_PUSH

GRAPH_TEXT=$(cat $GRAPHIC)

SLUG=thing

# echo $GRAPH_TEXT

JSON_FMT='{\n
    "strategy":"pr",
    "pullRequest": {
        "title": "Add up-to-date dependency graph",
        "body": "![Dependency graph](%s/dependencygraph.svg) \"Dependency graph\")\n%s",
        "branch": "atomist/dependency-cruiser"
  },
  "commit": {
    "message": "Add dependency graph"
  }
}'
printf "$JSON_FMT" "$SLUG" "$GRAPH_TEXT" > "$ATOMIST_PUSH"

cat $ATOMIST_PUSH
