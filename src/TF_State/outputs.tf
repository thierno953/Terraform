output "vpc_id" {
  value = module.tmbVPC.vpc_id
}

output "load_balancer_dns_name" {
  value = module.webserver.load_balancer_dns_name
}
