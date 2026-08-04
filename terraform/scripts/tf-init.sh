#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TF_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

MODULE_PATH="$(realpath --relative-to="${TF_ROOT}" "$(pwd)")"

case "$MODULE_PATH" in
    production/*|shared-services/*)
        ;;
    *)
        echo "Error: Run this script from inside a Terraform root module." >&2
        exit 1
        ;;
esac

KEY="${MODULE_PATH}/terraform.tfstate"

echo "======================================================"
echo "Terraform Backend Initialization"
echo "======================================================"
echo "Module          : ${MODULE_PATH}"
echo "Backend Bucket  : crystal-tfstate-987654321"
echo "Backend Profile : shared-services"
echo "State Key       : ${KEY}"
echo "======================================================"
echo

terraform init \
    -backend-config="${TF_ROOT}/backend.hcl" \
    -backend-config="key=${KEY}" \
    "$@"

echo
echo "======================================================"
echo "Backend initialized successfully."
echo "======================================================"