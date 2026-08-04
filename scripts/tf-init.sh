#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TF_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
MODULE_PATH="$(realpath --relative-to="${TF_ROOT}" "$(pwd)")"

case "$MODULE_PATH" in
  production/*)      PROFILE="production" ;;
  shared-services/*) PROFILE="shared-services" ;;
  *)
    echo "Error: can't infer AWS profile for module path '${MODULE_PATH}'." >&2
    exit 1
    ;;
esac

KEY="${MODULE_PATH}/terraform.tfstate"
echo "Module  : ${MODULE_PATH}"
echo "Profile : ${PROFILE}"
echo "Key     : ${KEY}"
echo

terraform init \
  -backend-config="${TF_ROOT}/backend.hcl" \
  -backend-config="key=${KEY}" \
  -backend-config="profile=${PROFILE}" \
  "$@"