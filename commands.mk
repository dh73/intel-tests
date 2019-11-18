YOSYS_PATH=/opt/eda/fpga/FOSS/yosys_altera
YOSYS_BIN=$(YOSYS_PATH)/binaries/bin/yosys
YOSYS_REF=$(YOSYS_PATH)/techlibs/common/simcells.v
OBJ=\$@.log

# Implemented targets so far.
dffeas_objs=$$_DFF_N_ $$_DFF_P_ $$_DFFE_NN_ $$_DFFE_NP_ \
	$$_DFFE_PN_ $$_DFFE_PP_ $$_DFF_NN0_ $$_DFF_NN1_ \
	$$_DFF_PN0_ $$_DFF_PN1_ $$_DFF_NP0_ $$_DFF_NP1_ \
	$$_DFF_PP0_ $$_DFF_PP1_

script='read_verilog $(YOSYS_REF); \
	design -save read; \
	hierarchy -top \$@; \
	proc; \
	flatten; \
	equiv_opt -assert -async2sync -map +/intel/max10/cells_sim.v synth_intel;'

CMD_EQUIV=$(YOSYS_BIN) -p $(script)

check_eq=./check.sh
