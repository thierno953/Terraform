locals {
  bucket_name = "btr-tf-project"
  table_name  = "tfrProject"

  ecr_repo_name = "tfr-app-ecr-repo"

  proj_app_cluster_name        = "ecs-app-cluster"
  availability_zones           = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  proj_app_task_famliy         = "ecs-app-task"
  container_port               = 3000
  proj_app_task_name           = "ecs-app-task"
  ecs_task_execution_role_name = "ecs-app-task-execution-role"

  application_load_balancer_name = "ecs-app-alb"
  target_group_name              = "ecs-alb-tg"

  proj_app_service_name = "ecs-app-service"
}
