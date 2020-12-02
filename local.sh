set -o pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory of Node project to test on> <directory to use as Atomist output directory>"
  exit 1
fi

docker build --tag springrod/dependency-cruiser .

# export ATOMIST_OUTPUT_DIR="/atm/output"
# export ATOMIST_PUSH="/atm/output/push.json"

docker run  -v $1:/atm/home \
            -v $2:/atm/output \
            -e ATOMIST_OUTPUT_DIR=/atm/output \
            -e ATOMIST_PUSH=/atm/output/push.json \
        springrod/dependency-cruiser

echo "Great success!"

echo $2/atm/output/push.json
