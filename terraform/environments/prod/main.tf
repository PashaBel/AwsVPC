provider "aws" {
  # access_key = "AKIA2BP6DKSP5SW5YFRP"
  # secret_key = "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"
  region     = "eu-central-1"
}

module "init" {
  source = "../../modules/main"

  environment     = var.environment
  aws_region_main = var.aws_region_main
  tags            = var.tags
}