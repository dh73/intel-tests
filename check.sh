#!/bin/bash

echo "[I] Checking LEC on Altera's dffeas"
equivalent=0;
nonequivalent=0;

for logfiles in ./*.log
do
    lf=$(basename -- "$logfiles")
    lf="${lf%.*}"
    echo "[I] Checking ${logfiles} log"
    if grep -lq "Equivalence successfully proven\!" ${logfiles}; then
        equivalent=$((equivalent+1))
        echo "The ${lf} cell is equivalent" >> reviewed_and_equivalent.log
    fi
    if grep -lq "Proof for base case failed" ${logfiles}; then
        nonequivalent=$((nonequivalent+1))
        echo "The ${lf} cell is non-equivalent" >> reviewed_and_nonequivalent.log
    fi
done

echo "[OK] Number of equivalent cells: ${equivalent}."
echo "[ER] Number of Non-equivalent cells: ${nonequivalent}."
echo "[I] For more information review reviewed_and_equivalent.log and reviewed_and_nonequivalent.log files"
