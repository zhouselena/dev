#!/usr/bin/env bash
# run-benchstat
# Runs benchmarks multiple times and comepares them using benchstat.

set -eux

cd ./internal/cmd/benchmark
export version=v2

export bench=SmallMultiInsert && go test -v \
    -run '^$' -bench '^BenchmarkMultiInsertSmallDocument' \
    -benchtime 5s -count 6 -cpu 2 -benchmem -timeout 999m \
| tee ${bench}-${version}.txt

export bench=LargeMultiInsert && go test -v \
    -run '^$' -bench '^BenchmarkMultiInsertLargeDocument' \
    -benchtime 5s -count 6 -cpu 2 -benchmem -timeout 999m \
| tee ${bench}-${version}.txt

benchstat base=SmallMultiInsert-v1.txt new=SmallMultiInsert-v2.txt > benchstatCompare_Small.txt
benchstat base=LargeMultiInsert-v1.txt new=LargeMultiInsert-v2.txt > benchstatCompare_Large.txt
