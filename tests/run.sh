#!/bin/zsh

# Exit on any error
set -e

# Path to the neovim binary. Adjust as necessary.
NVIM_PATH="nvim"

# Execute tests
echo "Running nvim-grooper tests..."
$NVIM_PATH -u tests/init.lua -c 'PlenaryBustedDirectory tests/ { minimal_init = "./init.lua" }'
echo "All tests passed!"

