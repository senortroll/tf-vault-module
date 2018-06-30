# tf-consul-module
Module that creates a Consul environment.

#### Repo Contents

* `backend.tf` - defines the provider and state backend.
* `consul.tf` - pulls remote state and creates a Consul resource.
* `vars.tf` - manages module input variables.

#### Behavior

This module wraps the `tf-application-module` module, adding resources specific to Consul environments.

#### Required Variables

* `aws_region`
* `profile`
* `remote_bucket`
* `remote_platform_key`
* `ipa_admin_password`
* `cluster_name`
* `key_name`
* `key_path`
* `product`
* `domain`
* `bastion_host`
* `chef_server`
* `chef_organization`
* `chef_user_name`
* `chef_user_key`
* `chef_role`
* `chef_environment`

#### Default Variables

* `instance_type = t2.medium`

#### Outputs

No outputs defined.

#### Usage

It is intended that this module be consumed via a Terragrunt configuration in the `plm_provisioning` repo. See repo for more details and examples of utilization.

https://github.com/patientslikeme/plm_provisioning

#### Additional Information

* PLM module references:
  * https://github.com/patientslikeme/tf-application-module
* Terraform resource references:
  * https://www.terraform.io/docs/providers/aws/index.html#profile
* Terragrunt:
  * https://github.com/gruntwork-io/terragrunt
