data "aws_caller_identity" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.default_tags
  }
}

provider "docker" {
  registry_auth {
    address     = "${local.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
    config_file = pathexpand("~/.docker/config.json")
  }
}
