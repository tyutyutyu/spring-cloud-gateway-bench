#!/usr/bin/env bash

set -e

REPORTS_DIR=/opt/reports

echo "Gateway Benchmark Script"

rm -f "${REPORTS_DIR}"/*.txt

function run() {
  echo "Wait 5 seconds"
  sleep 5
  echo "Running ${1}"
  bombardier \
    --connections=200 \
    --duration=30s \
    --format=json \
    --print=result \
    http://"${1}":8080/hello.txt \
    >> "${REPORTS_DIR}/${1}.txt"
}

run "static"
run "gateway"
run "nginx"

echo "Script Finished"
