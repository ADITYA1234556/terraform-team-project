#!/bin/bash
set -e #any problem from the commands below, script exits

terraform init
terraform fmt
terraform plan -out=tfplan.out
terraform apply tfplan.out