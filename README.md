# Terraform

- Is an open source "Infrastructure as Code" tool, created by HashiCorp.
- A "declarative" coding tool, Terraform enables developers to use a high-level configuration language called HCL (HashiCorp Configuration Language) to describe the desired "end-state" cloud or on-premise infrastructure for running an application.
- It then generates a plan for reaching that end-state and executes the plan to provision the infrastructure.

```bash
provider "google" {
    project = "{{YOUR GCP PROJECT}}"
    region  = "europe-west3"
    zone    = "europe-west3-c"
}
```

## Advantages

- Terraform can manage infrastucture on multiple cloud platforms.
- The human-readable configuration language helps you write infrastructure code easily.
- Terraform's state allows you to track the resource changes throughout your deployments.
- You can commit your configurations to version control to safely collaborate on infrastructure.

## Terraform workflow

- Terraform core workflow consists of lifecycle stages that can be used to manage the resources created on various platform.
- This Terraform core workflow consists of stages **init**, **validate**, **plan**, **plan**, **show** and **destroy**.
- The stages are executed as commands to perform the respective operations expected by them.

```bash
#The terraform init command initializes a working directory containing Terraform configuration files.
terraform init

#The terraform validate command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.

terraform validate

#The terraform plan command lets you to preview the actions Terraform would take to modify the infrastructure or save a speculative plan which you can apply later.

terraform plan

#The terraform apply command executes the actions proposed in a terraform plan and can be used to deploy the infrastructure.

terraform apply || terraform apply -auto-approve

#The terraform show command is used to provide human-readable output from a state or plan file.

terraform show

#The terraform destroy command terminates the resources managed by the Terraform project.

terraform destroy
```
