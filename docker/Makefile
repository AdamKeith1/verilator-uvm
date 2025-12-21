

# .PHONY: env
# env:
# 	docker build -t verilator-uvm .
# 	docker run -it \
# 	  -v $(pwd)/../rtl:/workspace/rtl \
# 	  -v $(pwd)/../uvm:/workspace/uvm \
# 	  verilator-uvm bash
# .PHONY: env
# env:
# 	docker build -t verilator-uvm .
# 	# run container in background so we can copy files
# 	docker run -dit --name verilator-dev verilator-uvm bash
# 	# copy your RTL and UVM files
# 	docker cp ../rtl verilator-dev:/workspace/rtl
# 	docker cp ../uvm verilator-dev:/workspace/uvm
# 	# attach to container
# 	docker exec -it verilator-dev bash

.PHONY: env
env:
	docker build -t verilator-uvm ./
	# remove existing container if it exists
	-docker rm -f verilator-dev
	# run container in background
	docker run -dit --name verilator-dev \
	  -v "$(PWD)/../:/workspace" \
	  verilator-uvm bash
	# attach to container
	docker exec -it verilator-dev bash


# .PHONY: run
# run:
# 	verilator -Wno-fatal --binary -j $(nproc) --top-module top \
# 	    +incdir+$UVM_HOME +define+UVM_NO_DPI +incdir+$(pwd) \
# 	    $UVM_HOME/uvm_pkg.sv $(pwd)/rtl/alu/alu.sv $(pwd)/uvm/block/alu/testbench/testbench.sv