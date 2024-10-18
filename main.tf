#!/bin/bash
set -e

terraform init
terraform fmt
terraform plan -out=tfplan.out
terraform apply tfplan.out