# Intel Tests

## Description
This repository contains very simple scripts to run equivalence checking on `dffeas` Intel (Altera) primitives.

## How to
Tool paths are fixed right now, in `commands.mk`. Please set the `YOSYS_PATH` and `YOSYS_BIN` accordingly.
```bash
commands.mk
YOSYS_PATH=$(YOSYS_HOME)
YOSYS_BIN=$(YOSYS_PATH)/binaries/bin/yosys
YOSYS_REF=$(YOSYS_PATH)/techlibs/common/simcells.v
```

To execute the test, simply run:
```bash
make -j$(nproc)
```

Logs with `cellname`.log are generated. A bash script `check.sh` parses all logs and shows what cells are correct/incorrect.
```bash
[I] Checking LEC on Altera's dffeas
[I] Checking ./$_DFFE_NN_.log log
[I] Checking ./$_DFFE_NP_.log log
[I] Checking ./$_DFFE_PN_.log log
[I] Checking ./$_DFFE_PP_.log log
[I] Checking ./$_DFF_NN0_.log log
[I] Checking ./$_DFF_NN1_.log log
[I] Checking ./$_DFF_NP0_.log log
[I] Checking ./$_DFF_NP1_.log log
[I] Checking ./$_DFF_N_.log log
[I] Checking ./$_DFF_PN0_.log log
[I] Checking ./$_DFF_PN1_.log log
[I] Checking ./$_DFF_PP0_.log log
[I] Checking ./$_DFF_PP1_.log log
[I] Checking ./$_DFF_P_.log log
[OK] Number of equivalent cells: 14.
[ER] Number of Non-equivalent cells: 0.
[I] For more information review reviewed_and_equivalent.log and reviewed_and_nonequivalent.log files
```