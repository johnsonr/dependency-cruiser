set -o pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

docker build --tag springrod/dependency-cruiser:$1 .
docker push springrod/dependency-cruiser:$1