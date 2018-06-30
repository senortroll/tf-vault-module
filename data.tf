data "terraform_remote_state" "consul" {
  backend = "s3"

  config {
    bucket = "${var.remote_bucket}"
    key    = "us-east-2/infra/consul/terraform.tfstate"
    region = "${var.global_remote_aws_region}"
  }
}

data "terraform_remote_state" "app" {
  backend = "s3"

  config {
    bucket = "${var.remote_bucket}"
    key    = "${var.remote_app_key}"
    region = "${var.remote_aws_region}"
  }
}

data "terraform_remote_state" "platform" {
  backend = "s3"

  config {
    bucket = "${var.remote_bucket}"
    key    = "${var.remote_platform_key}"
    region = "${var.remote_aws_region}"
  }
}

data "terraform_remote_state" "infra_bootstrap" {
  backend = "s3"

  config {
    bucket = "${var.remote_bucket}"
    key    = "${var.remote_bootstrap_key}"
    region = "${var.remote_aws_region}"
  }
}

data "terraform_remote_state" "global" {
  backend = "s3"

  config {
    bucket = "${var.global_remote_bucket}"
    key    = "${var.global_remote_global_key}"
    region = "${var.global_remote_aws_region}"
  }
}
