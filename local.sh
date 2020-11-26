set -o pipefail

docker build --tag springrod/dependency-cruiser .

export ATOMIST_PUSH="/atm/home/commit.json"
echo $ATOMIST_PUSH

docker run  -v /Users/rod/interbeat/interbeat-app:/atm/home springrod/dependency-cruiser
