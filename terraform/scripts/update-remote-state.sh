#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

update_file() {

    local file="$1"

    local text
    text="$(cat "$file")"

    replace() {

        local old="$1"
        local key="$2"

        text="$(printf "%s" "$text" | perl -0777 -pe "
s#backend\\s*=\\s*\"local\"\\s*config\\s*=\\s*\\{\\s*path\\s*=\\s*\"$old\"\\s*\\}#backend = \"s3\"

  config = {

    bucket  = \"crystal-tfstate-987654321\"

    key     = \"$key\"

    region  = \"ap-south-1\"

    profile = \"shared-services\"

  }#gs;
")"

    }

    case "$file" in

        */production/aws-load-balancer-controller/main.tf)

            replace "../eks-cluster/terraform.tfstate" "production/eks-cluster/terraform.tfstate"
            replace "../networking/terraform.tfstate" "production/networking/terraform.tfstate"
            replace "../irsa/terraform.tfstate" "production/irsa/terraform.tfstate"
            ;;

        */production/bastion/main.tf)

            replace "../networking/terraform.tfstate" "production/networking/terraform.tfstate"
            ;;

        */production/eks-addons/main.tf)

            replace "../eks-cluster/terraform.tfstate" "production/eks-cluster/terraform.tfstate"
            replace "../irsa/terraform.tfstate" "production/irsa/terraform.tfstate"
            ;;

        */production/eks-cluster/main.tf)

            replace "../networking/terraform.tfstate" "production/networking/terraform.tfstate"
            replace "../../shared-services/management/terraform.tfstate" "shared-services/management/terraform.tfstate"
            ;;

        */production/eks-node-group/main.tf)

            replace "../networking/terraform.tfstate" "production/networking/terraform.tfstate"
            replace "../eks-cluster/terraform.tfstate" "production/eks-cluster/terraform.tfstate"
            ;;

        */production/irsa/main.tf)

            replace "../oidc-provider/terraform.tfstate" "production/oidc-provider/terraform.tfstate"
            ;;

        */production/oidc-provider/main.tf)

            replace "../eks-cluster/terraform.tfstate" "production/eks-cluster/terraform.tfstate"
            ;;

        */shared-services/management/main.tf)

            replace "../networking/terraform.tfstate" "shared-services/networking/terraform.tfstate"
            ;;

    esac

    printf "%s" "$text" > "$file"

    echo "Updated $file"

}

export -f update_file

find "$ROOT/terraform" -name main.tf | while read -r f
do
    update_file "$f"
done

echo
echo "=============================================="
echo "All terraform_remote_state blocks updated."
echo "=============================================="