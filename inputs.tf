# Basic AWS Stuff
variable "aws_region" {}

variable "profile" {}
variable "key_name" {}
variable "key_path" {}

# Remote State
variable "remote_bucket" {}

variable "remote_aws_region" {}

variable "remote_app_key" {}
variable "remote_platform_key" {}
variable "remote_bootstrap_key" {}

variable "global_remote_bucket" {}

variable "global_remote_global_key" {}

variable "global_remote_aws_region" {}

variable "environment" {}

# Product / Domain
variable "product" {}

variable "domain" {}

# Chef Info
variable "chef_server" {}

variable "chef_organization" {}
variable "chef_user_name" {}
variable "chef_user_key" {}
variable "chef_environment" {}

# AMI
variable "ami" {}

variable "cluster_name" {}

# vault-specific settings
variable "vault_chef_role" {
  default = "vault"
}

variable "vault_server_count" {
  default = 3
}

variable "vault_server_type" {
  default = "vault"
}

variable "vault_data_volume_size" {
  default = 200
}

variable "server_termination_protection" {
  default = false
}

variable "vault_instance_type" {}
