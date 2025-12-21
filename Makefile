RTL_DIR := ./rtl
UVM_DIR := ./uvm/block/alu/testbench

.PHONY: help
help:
	@echo "helptext coming soon..."

.PHONY: clean
clean:
	rm -rf obj_dir

# TODO: mod and tb name vars
.PHONY: build
build:
	verilator -Wno-fatal --binary -j --top-module top \
		+incdir+/opt/1800.2-2017-1.0/src \
		+define+UVM_NO_DPI \
		+incdir+$(UVM_DIR) \
		/opt/1800.2-2017-1.0/src/uvm_pkg.sv \
		$(RTL_DIR)/alu/alu.sv \
		$(UVM_DIR)/testbench.sv

.PHONY: run
run:
	obj_dir/Vtop +UVM_TESTNAME=alu_test

# FIXME: clean/gitignore obj dir