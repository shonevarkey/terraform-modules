# Terraform Modules for Management Infrastructure

This repository contains Terraform modules to set up a management VPC and a bastion server. The modules are designed to be reusable and modular, facilitating the creation and management of infrastructure.

## Modules

### Management VPC (`management-vpc`)

This module is responsible for creating the Virtual Private Cloud (VPC) and its associated components.

### Management Bastion (`management-bastion`)

This module sets up a bastion server within the management VPC, providing secure access to your infrastructure.

## Repository Structure

The repository is organized as follows:

- `management/`: Contains Terraform code to set up the state, provider configurations, security groups, VPC, and bastion servers.
  - `01-lantern-management-vpc.tf`: Terraform code for creating the management VPC.
  - `02-lantern-management-bastion-securitygroup.tf`: Terraform code for creating the security group for the bastion server.
  - `03-lantern-management-bastion.tf`: Terraform code for creating the bastion server.
  - `provider.tf`: Terraform provider configuration.
  - `state.tf`: Terraform state configuration.
- `modules/`: Contains the reusable Terraform modules.
  - `management-vpc/`: Module for creating the management VPC.
    - `vars.tf`: Variable definitions for the VPC module.
    - `outputs.tf`: Output definitions for the VPC module.
    - `networking.tf`: Terraform code for networking resources in the VPC.
  - `management-bastion/`: Module for creating the bastion server.
    - `vars.tf`: Variable definitions for the bastion module.
    - `outputs.tf`: Output definitions for the bastion module.
    - `bastion.tf`: Terraform code for the bastion server.
- `.gitignore`: Specifies files and directories to be ignored by git.
- `README.md`: This file.

## Prerequisites

- Terraform >= 0.12
- An AWS account with the necessary permissions to create VPCs and EC2 instances
- AWS CLI configured with appropriate credentials

## Applying the Configuration

Initialize the Terraform configuration and apply the changes:

- terraform init
- terraform apply

