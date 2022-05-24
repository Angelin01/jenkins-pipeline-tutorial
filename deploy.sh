#!/bin/bash

set -eu

if [ "$#" -ne 2 ]; then
  echo "Error: wrong number of arguments" >&2
  echo "Usage: $0 PROJECT_NAME VERSION" >&2
  exit 1
fi

cd "$(dirname "$(readlink -f "$0")")"

project=$1
version=$2

artifact="$project-$version.jar"
if [ ! -f "./target/$artifact" ]; then
  echo "Failed finding artifact $artifact. Did you build your project? Try running 'mvn package'." >&2
  exit 1
fi

fake_deploy() {
  local deployTotal=0
  while [ "$deployTotal" -lt 100 ]; do
    echo "Deploying... $deployTotal%"
    sleep 1
    deployTotal=$(( deployTotal + (RANDOM % 40) ))
  done
  echo "Deploying... 100%"
}

echo "Deploying $project on version $version ($artifact)..."
fake_deploy
echo "Done! Deployed $project version $version ($artifact)."
