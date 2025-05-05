#!/usr/bin/env bash

set -eu

CR="${1}"
"${CR}" upload --config .cr.yaml
