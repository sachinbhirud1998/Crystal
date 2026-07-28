# Project Crystal

## Module

Subnet

---

## Purpose

Creates reusable Public and Private Subnets.

---

## Resources

- aws_subnet (Public)
- aws_subnet (Private)

---

## Inputs

| Variable | Description |
|----------|-------------|
| vpc_id | VPC ID |
| public_subnets | Public subnet map |
| private_subnets | Private subnet map |
| tags | Common tags |

---

## Outputs

- public_subnet_ids
- private_subnet_ids

---

## Current Scope

Creates only:

- Public Subnet A
- Public Subnet B
- Private Subnet A
- Private Subnet B

Does NOT create:

- Internet Gateway
- Route Tables
- NAT Gateway
- Route Associations
- Network ACLs
- VPC Endpoints
- Security Groups

Those resources belong to later milestones.