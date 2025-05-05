#!/usr/bin/env bash

set -eu

CR="${1}"
"${CR}" index --config .cr.yaml
