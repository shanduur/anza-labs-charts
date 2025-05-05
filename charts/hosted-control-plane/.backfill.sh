#!/usr/bin/env bash

set -eu

YQ="${1}"

"${YQ}" '.appVersion = load("./values.yaml").kubernetes.version' './Chart.yaml' -i
