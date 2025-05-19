#!/usr/bin/env bash

set -eu

YQ="${1}"

"${YQ}" '.appVersion = load("./values.yaml").firecracker.image.tag' './Chart.yaml' -i
