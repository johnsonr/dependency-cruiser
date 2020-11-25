#!/bin/bash

set -o pipefail

depcruise --include-only "^src" --output-type dot src | dot -T svg > dependencygraph.svg
