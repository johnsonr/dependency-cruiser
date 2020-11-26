set -o pipefail

docker build --tag springrod/dependency-cruiser .

export ATOMIST_OUTPUT_DIR="/atm/output"

docker run  -v /Users/rod/interbeat/interbeat-app:/atm/home springrod/dependency-cruiser
