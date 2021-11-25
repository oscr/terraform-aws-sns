## Defaults
terraform {
  required_version = ">= 1.0.10"
  backend "remote" {}
}

provider "aws" {
  region = var.region
}

## Create Labels
module "labels" {
  source     = "aws-ia/label/aws"
  version    = "0.0.3"
  region     = var.region
  namespace  = var.namespace
  env        = var.environment
  account    = var.account
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags = merge(var.tags, {
    "deployed_by" = "quickstart-terraform"
    "project"     = var.name
  })
}

## Create SNS
module "qs_sns" {
  source            = "../"
  topic_name        = module.labels.id
  tags              = module.labels.tags
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  access_type       = var.access_type
  protocol          = var.protocol
  endpoint          = var.endpoint
}