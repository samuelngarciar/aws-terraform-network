provider "aws" {
  region = var.region

  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

provider "vault" {}

data "terraform_remote_state" "admin" {
  backend = "remote"

config = {
    organization = "testsam1"
    workspaces   = {
      name = "hashicorp-vault-admin"
    }
  }
}

data "vault_aws_access_credentials" "creds" {
  backend = data.terraform_remote_state.admin.outputs.backend
  role    = data.terraform_remote_state.admin.outputs.rolenet
}

resource "aws_vpc" "vpccloud" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnetcloud" {
  vpc_id                  = aws_vpc.vpccloud.id
  cidr_block              = "${var.subnet_range}"
  availability_zone       = "${var.region}a"
}

