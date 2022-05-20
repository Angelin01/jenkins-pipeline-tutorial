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
SUPER_CREDENTIALS=${SUPER_CREDENTIALS:-}

artifact="$project-$version.jar"
if [ ! -f "./target/$artifact" ]; then
  echo "Failed finding artifact $artifact. Did you build your project?" >&2
  exit 1
fi

fake_deploy() {
  local percent=$1
  echo "SUPER Deploying... $percent%"
  sleep 1
}

if [ -z "$SUPER_CREDENTIALS" ] || [ "$SUPER_CREDENTIALS" != "PastelDeCalabresa" ]; then
  echo "Unauthorized! Please provide the appropriate credentials with the SUPER_CREDENTIALS env var" >&2
  exit 1
fi

echo "SUPER Deploying $project on version $version ($artifact)..."
deployTotal=0
while [ "$deployTotal" -lt 100 ]; do
  fake_deploy "$deployTotal"
  deployTotal=$(( deployTotal + (RANDOM % 25) ))
done
echo "Done! SUPER Deployed $project version $version ($artifact)."
