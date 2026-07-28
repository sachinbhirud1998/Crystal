# Project Crystal

## Milestone 2.1

### Shared Services Networking

---

## Purpose

Deploys the Shared Services VPC for Project Crystal.

This stack consumes the reusable VPC module.

---

## Current Scope

✅ Shared Services VPC

---

## Architecture

Account

Shared Services

Region

ap-south-1

VPC

10.0.0.0/16

---

## Resources

- Amazon VPC

---

## Not Included

- Internet Gateway
- Route Tables
- NAT Gateway
- Public Subnets
- Private Subnets
- VPC Endpoints
- Security Groups
- Network ACLs

These resources will be implemented in later milestones.

---

## Module Used

terraform/modules/vpc

---

## Deployment Order

1. terraform init
2. terraform fmt
3. terraform validate
4. terraform plan
5. terraform apply