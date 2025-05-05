#!/usr/bin/env bash

set -eu

CR="${1}"
CHANGED="${2}"

mkdir -p .cr-release-packages

while IFS= read -r chart; do
    "${CR}" package "${chart}"
done < "${CHANGED}"
