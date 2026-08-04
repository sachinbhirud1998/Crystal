#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TF_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

MODULES=(
    "production/networking"
    "production/bastion"
    "production/eks-cluster"
    "production/eks-node-group"
    "production/eks-addons"
    "production/aws-load-balancer-controller"
    "production/rbac"
    "production/irsa"
    "production/oidc-provider"
    "shared-services/networking"
    "shared-services/management"
)

echo
echo "=========================================================="
echo " Project Crystal - Terraform State Migration"
echo "=========================================================="
echo

for module in "${MODULES[@]}"
do
    echo
    echo "=========================================================="
    echo "Migrating: ${module}"
    echo "=========================================================="

    cd "${TF_ROOT}/${module}"

    terraform init \
        -backend-config="${TF_ROOT}/backend.hcl" \
        -backend-config="key=${module}/terraform.tfstate" \
        -migrate-state

    echo
    echo "Running terraform plan..."
    terraform plan

    echo
    read -rp "Is the plan clean (No changes)? Type YES to continue: " answer

    if [[ "$answer" != "YES" ]]; then
        echo
        echo "Stopping migration."
        echo "Investigate ${module} before continuing."
        exit 1
    fi

    echo
    echo "Verifying state exists in S3..."

    aws s3 ls \
      "s3://crystal-tfstate-987654321/${module}/" \
      --profile shared-services

    echo
    read -rp "State verified in S3? Type YES to delete local state: " verify

    if [[ "$verify" != "YES" ]]; then
        echo
        echo "Stopping migration."
        exit 1
    fi

    rm -f terraform.tfstate terraform.tfstate.backup

    echo
    echo "✓ Local state removed"
    echo "✓ ${module} migrated successfully"

done

echo
echo "=========================================================="
echo " ALL TERRAFORM STATES MIGRATED SUCCESSFULLY"
echo "=========================================================="