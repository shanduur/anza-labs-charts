#!/usr/bin/env bash

set -eu

PR_TITLE="${1}"
PR="${2}"
GITHUB_ENV="${3}"
SEMVER="${4:-semver}"

# Regex for a semver digit
D='0|[1-9][0-9]*'
# Regex for a semver pre-release word
PW='[0-9]*[a-zA-Z-][0-9a-zA-Z-]*'
# Regex for a semver build-metadata word
MW='[0-9a-zA-Z-]+'

# Match: chore(main): release <chart-name> <chart-version>
if [[ "$PR_TITLE" =~ ^chore\(main\):[[:space:]]+release[[:space:]]+([a-zA-Z0-9_-]+)[[:space:]]+(.+)$ ]]; then
    chart_name="${BASH_REMATCH[1]}"
    chart_version="${BASH_REMATCH[2]}"

    echo "chart_name=${chart_name}" >> "${GITHUB_ENV}"
    "${SEMVER}" validate "${chart_version}"
    echo "chart_version=${chart_version}" >> "${GITHUB_ENV}"

    branch=$(gh pr view "${PR}" --json='headRefName' -q='.headRefName')
    echo "branch=${branch}" >> "${GITHUB_ENV}"

    # Failsafe: Do not allow running on the 'main' branch
    if [[ "${branch}" == "main" ]]; then
        echo "Refusing to run this command on the 'main' branch." >&2
        exit 1
    fi
else
    echo "PR title format invalid. Expected: 'chore(main): release <chart-name> <chart-version>'." >&2
    exit 1
fi
