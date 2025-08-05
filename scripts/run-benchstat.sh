#!/usr/bin/env bash
# run-benchstat
# Runs benchmarks multiple times and comepares them using benchstat.

set -eux

export bench=v1 && go test \
    -run '^$' -bench '^BenchmarkTest' \
    -benchtime 5s -count 6 -cpu 2 -benchmem -timeout 999m \
| tee ${bench}.txt

export bench=v2 && go test \
    -run '^$' -bench '^BenchmarkTest' \
    -benchtime 5s -count 6 -cpu 2 -benchmem -timeout 999m \
| tee ${bench}.txt

benchstat base=v1.txt new=v2.txt > benchstatCompare.txt
