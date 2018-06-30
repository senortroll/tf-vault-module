resource "aws_security_group" "vault_sg_internal" {
  name        = "vault_sg_internal"
  description = "Allows Vault communication"
  vpc_id      = "${data.terraform_remote_state.platform.infra_vpc_id}"

  ingress {
    description = "Vault listener"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "Vault listener (public)"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}

module "vault" {
  source                        = "git::git@github.com:patientslikeme/tf-application-module.git"
  server_key_name               = "${var.key_name}"
  server_key_path               = "${var.key_path}"
  server_product                = "${var.product}"
  server_instance_type          = "${var.vault_instance_type}"
  server_domain                 = "${var.domain}"
  server_bastion_host           = "${data.terraform_remote_state.infra_bootstrap.bastion_host}"
  server_chef_server            = "${var.chef_server}"
  server_chef_organization      = "${var.chef_organization}"
  server_chef_environment       = "${var.chef_environment}"
  server_chef_user_name         = "${var.chef_user_name}"
  server_chef_user_key          = "${var.chef_user_key}"
  server_chef_role              = "${var.vault_chef_role}"
  server_subnet_ids             = "${data.terraform_remote_state.platform.infra_data_subnets}"
  server_server_count           = "${var.vault_server_count}"
  server_server_type            = "${var.vault_server_type}"
  server_external_volume        = true
  server_data_volume_size       = "${var.vault_data_volume_size}"
  server_ami                    = "${var.ami}"
  server_environment            = "${var.environment}"
  server_region                 = "${var.aws_region}"
  server_termination_protection = "${var.server_termination_protection}"
  server_cluster_name           = "${var.cluster_name}"

  server_instance_profile = "${data.terraform_remote_state.global.ops_default_instance_profile}"

  server_security_groups = [
    "${data.terraform_remote_state.platform.infra_sg_ssh}",
    "${data.terraform_remote_state.consul.consul_sg_internal}",
    "${aws_security_group.vault_sg_internal.id}",
  ]
}
