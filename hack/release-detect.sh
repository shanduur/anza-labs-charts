#!/usr/bin/env bash

set -eu

YQ="${1}"
CHANGED="${2}"

echo -n "" >> "${CHANGED}"
for chart in ./charts/*; do
    [ -d "$chart" ] || continue
    chart_name=$(basename "${chart}")
    chart_file="${chart}/Chart.yaml"
    [ -f "${chart_file}" ] || continue

    # Get the last committed version of Chart.yaml
    old_version=$(git show HEAD^:"${chart_file}" 2>/dev/null | "${YQ}" '.version' || echo "")
    new_version=$("${YQ}" '.version' "${chart_file}")

    if [ "${old_version}" != "${new_version}" ]; then
        echo "Detected version change in ${chart_name}: ${old_version} -> ${new_version}"
        echo "${chart}" >> "${CHANGED}"
    fi
done