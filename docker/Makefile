

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
