# Apply the terraform configuration using following command

```bash
# 1. terraform init for PROD 

terraform init --var-file="production.tfvars"

# 2. terraform plan for PROD 

terraform plan --var-file="production.tfvars"

# 3. terraform apply for PROD 

terraform apply --var-file="production.tfvars"
```