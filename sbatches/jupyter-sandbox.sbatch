#!/bin/bash

PORT=$1
NOTEBOOK_DIR=$2
if [ -z "$NOTEBOOK_DIR" ]; then
    cd $SCRATCH
else
    cd $NOTEBOOK_DIR
fi

module load sandbox # Only provides jupyter lab

# Pre-specifying a kernel is not supported
# See https://discourse.jupyter.org/t/auto-select-kernel-without-starting-the-launcher-so-users-dont-have-to/24045/4
jupyter lab --no-browser --port=$PORT --KernelSpecManager.ensure_native_kernel=False