# Terraform

# Init stage:
  * The **terraform init** command initializes a working directory containing terraform configuration files.
  * This is first command that should be run after writing a new configuration or cloning and existing one from version control.
  * When you run the command, terraform will download all the necessary plugins required to execute the terraform code and create the resources.

# Validate stage:
  * The **terraform validate*$ command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
  * Validate runs checks that verify wheter a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state.
  * It is thus primarily useful for general verification of reusable modules, including corrections of attributes names and value types.

# Plan stage:
  * Once we are done writing the code, we execute the plan stage.
  * The **terraform plan** command lets you to preview the actions Terraform would take to modify the infrastructure or save a speculative plan which you can apply later.
  * The function of terraform plan is speculative. You cannot apply it unless you save its contents and pass them to a **terraform apply** command.
  * This command is just for the creation of a plan for you to verify/review the work done by you and your teammates, it does not change the deployment.
  * So, you can update the terraform configuration if the plan is not as per your requirements.

# Apply stage:
  * Once you are satisfied with the plan, you can create the infrastructure in this stage.
  * The **terraform apply** command executes the actions proposed in a terraform plan and can be used to deploy the infrastructure.
  * When you run the command, terraform will automatically create a new execution plan as if you had run **terraform plan"**, prompts you to approve that plan and then takes the indicated actions to create the infrastructure.

# Show stage:
  * The **terraform show** command is used to provide human-readable output from a state or plan file.
  * This can be used to inspect a plan to ensure that the planned operations are expected or to inspect the current state as terraform sees it.
  * You may use **show** with a path to either a **terraform state file** or **plan file**.
  * If you do not specify a file path, terraform will show the latest state snapshot.


# Destroy stage:
  * At any point, if you do not want the reources or the infrastruction, you can destroy them.
  * The **terraform destroy** command terminates the resources managed by the terraform project.
  * This command is the reverse of **terraform apply** in that it terminates all the resources specified.
  * It does not destroy the resources running elsewhere that are not managed by the current terraform project.
