# @Author: juan
# @Date:   2019-01-29T12:06:08+09:00
# @Last modified by:   juan
# @Last modified time: 2019-01-29T12:06:37+09:00

.PHONY: clean install remove

## GLOBALS ##

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
ACT=$(shell which activate)
PY=$(shell which python)
endif

## COMMANDS ##

## Default
default:
	@echo "Options:"
	@echo "    make clean      # Delete all compiled Python files and unnecessary files."
	@echo "    make install    # Install libraries and create the conda environment 'daily'."
	@echo "    make remove     # Remove libraries and clean del folder."
	@echo ""
	@echo ${PY}

## delete all compiled Python files
clean:
	find . -name "*.pyc" -exec rm {} \;
	find . -name "__pycache__" -exec rmdir {} \;
	find . -name "*.dly" -exec rm {} \;
	find . -name "*.csv" -exec rm {} \;
	find . -name "ghcnd-stations.txt" -exec rm {} \;
	find . -name "ghcnd-inventory.txt" -exec rm {} \;

## set up python interpreter environment
install:
ifeq (True,$(HAS_CONDA))
	@echo ">>> Detected conda, creating conda environment."
	conda env create -f environment.yml
	@echo ">>> Clone the required repository from GitHub."
	git clone https://github.com/jjrennie/GHCNpy.git
	@echo ">>> done."
else
	@echo ">>> Conda is not available."
endif

## set up python interpreter environment
remove:
ifeq (True,$(HAS_CONDA))
	@echo ">>> Detected conda, removing the conda environment."
	conda remove --name daily --all
	@echo ">>> Remove the folder of the library."
	(rm -rf GHCNpy)
	@echo ">>> done."
else
	@echo ">>> Conda is not available."
endif
