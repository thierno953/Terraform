locals {
  bucket_name = "dcbt-state-backend"
  table_name  = "dcbt-state-locking"

  default_vpc_name    = "defaultVPC"
  default_subnet_name = "defaultSubnet"

  ec2_security_group_name    = "ec2SecurityGroup"
  ec2_security_group_desc    = "Allow access on Ports 22 and 8080"
  ec2_security_group_tag_val = "Jenkins Server Security Group"

  ec2_security_group_http_proxy_desc     = "HTTP Proxy"
  ec2_security_group_http_proxy_port     = 8080
  ec2_security_group_http_proxy_protocol = "tcp"
  ec2_security_group_http_proxy_cidr     = "0.0.0.0/0"

  ec2_security_group_ssh_proxy_desc     = "SSH Proxy"
  ec2_security_group_ssh_proxy_port     = 22
  ec2_security_group_ssh_proxy_protocol = "tcp"
  ec2_security_group_ssh_proxy_cidr     = "0.0.0.0/0"

  ec2_security_group_egress_port      = 0
  ec2_security_group_egrress_protocol = -1
  ec2_security_group_egress_cidr      = "0.0.0.0/0"

  ec2_keypair_name     = "tf-key-pair"
  ec2_instanct_tag_val = "JenkinsServer"

  iam_policy_name               = "jenkins-iam-policy"
  iam_role_name                 = "jenkins-iam-role"
  iam_policy_attachment_name    = "policy-attachment"
  jenkins_instance_profile_name = "jenkins-instance-prof"

  ssh_connection_user             = "ubuntu"
  ssh_connection_file_source      = "./scripts/script.sh"
  ssh_connection_file_destination = "/tmp/script.sh"
}
