#!/usr/bin/env bash

set -eu

COMMENT="${1}"
PR="${2}"
GITHUB_ENV="${3}"
SEMVER="${4:-semver}"

# Regex for a semver digit
D='0|[1-9][0-9]*'
# Regex for a semver pre-release word
PW='[0-9]*[a-zA-Z-][0-9a-zA-Z-]*'
# Regex for a semver build-metadata word
MW='[0-9a-zA-Z-]+'

if [[ "$COMMENT" =~ ^/ci[[:space:]]+([a-zA-Z0-9_-]+)[[:space:]]+(.+)$ ]]; then
    echo "chart_name=${BASH_REMATCH[1]}" >> $GITHUB_ENV
    "${SEMVER}" validate "${BASH_REMATCH[2]}"
    echo "chart_version=${BASH_REMATCH[2]}" >> $GITHUB_ENV
    branch=$(gh pr view "${PR}" --json='headRefName' -q='.headRefName')
    echo "branch=${branch}" >> $GITHUB_ENV
else
    echo "Comment format invalid. Expected '/ci <chart-name> <chart-version>'." >&2
    exit 1
fi
