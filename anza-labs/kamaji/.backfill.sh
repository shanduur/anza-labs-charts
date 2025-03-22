#!/usr/bin/env bash

set -eux

YQ="${1}"

# Update Chart.yaml with the image tag from values.yaml
"${YQ}" '.appVersion = load("./values.yaml").image.tag' './Chart.yaml' -i

VERSION=$("${YQ}" '.image.tag' ./values.yaml)

CRDS=$(curl -fsSL "https://api.github.com/repos/clastix/kamaji/git/trees/${VERSION}?recursive=1" |\
    jq -r '[.tree.[] | select(.path | startswith("charts/kamaji/crds/"))] | .[].path')

# Remove previous file if it exists
rm -rf ./crds
mkdir -p ./crds

while IFS= read -r CRD; do
    CRD_FILE="./crds/$(basename "${CRD}")"
    curl -fsSL "https://raw.githubusercontent.com/clastix/kamaji/refs/tags/${VERSION}/${CRD}" > "${CRD_FILE}"
    "${YQ}" '.' "${CRD_FILE}" -i
done <<< "${CRDS}"
