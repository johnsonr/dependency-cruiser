set -o pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <directory of Node project to test on>"
  exit 1
fi

docker build --tag springrod/dependency-cruiser .

export ATOMIST_OUTPUT_DIR="/atm/output"

docker run  -v $1:/atm/home springrod/dependency-cruiser

echo "Great success!"
