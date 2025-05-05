#!/usr/bin/env bash

set -eu

CR="${1}"
TOKEN="${2}"

"${CR}" upload \
    --config .cr.yaml \
    --token="${TOKEN}" \
    --owner anza-labs \
    --git-repo charts
