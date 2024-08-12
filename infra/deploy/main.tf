terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket               = "infra-blueprint-tfstate"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env" #Staging or #Prod environment
    region               = "eu-west-1"
    encrypt              = true
    dynamodb_table       = "infra-state-lock"
  }
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}" #Dynamic generate strings for workspace especially in complex projects
}

data "aws_region" "current" {} #import data from aws
