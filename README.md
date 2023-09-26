# Custom AMI creation with Packer and Terraform

This repository contains the code to create a custom AMI with Packer and Terraform.

# How to use this repository
This project is broken up into two parts:
1. Creating a custom AMI with Packer
2. Deploying the custom AMI in an EC2 instance with Terraform

## Creating a custom AMI with Packer
This custom AMI only add custom users to the base AMI.
1. Clone this repository
2. Install Packer
3. Authenticate with AWS
4. Add your username and public key to the `vars/users.yml` file
5. Run `packer build packer.json`

## Deploying the custom AMI in an EC2 instance with Terraform
You can deploy the custom AMI in an EC2 instance with this Terraform project.
The Terraform project need an existing VPC and subnet, as well as the previously created AMI.

1. Install Terraform
2. Authenticate with AWS
3. Run `terraform init`
4. Run `terraform apply`
5. Run `terraform destroy` to destroy the infrastructure




