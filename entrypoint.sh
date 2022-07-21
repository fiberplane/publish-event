#!/usr/bin/env bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

API_TOKEN=$1
TITLE=$2
LABELS=$3
TIME=$4
BASE_URL=$5

if [[ -z $API_TOKEN ]]; then
  echo "A valid Fiberplane API token is required to post a event" >&2
  exit 1
fi

if [[ -z $TITLE ]]; then
  echo "Please specify a title for the event" >&2
  exit 1
fi

if [[ -z $LABELS ]]; then
  echo "Please specify at least a single label for the event" >&2
  exit 1
fi

if [[ -z $BASE_URL ]]; then
  echo "A valid Fiberplane API base url is required" >&2
  exit 1
fi

additional_args=()

# https://stackoverflow.com/a/10586169/11494565
IFS='|' read -r -a labels_array <<< "$LABELS"

# https://stackoverflow.com/a/8880633/11494565
for i in "${labels_array[@]}"
do
  additional_args+=(--label "$i")
done

if [[ -n $TIME ]]; then
  additional_args+=(--time "$TIME")
fi

echo "api_token = '$API_TOKEN'" > config.toml
export CONFIG="$(pwd)/config.toml"

export API_BASE="$BASE_URL"
export DISABLE_VERSION_CHECK=true

output=$(/usr/bin/fp events create -v --title "$TITLE" "${additional_args[@]}" --output json)
id=$(jq -n '$in.id' --argjson in "$output")

echo "::set-output name=id::$id"
