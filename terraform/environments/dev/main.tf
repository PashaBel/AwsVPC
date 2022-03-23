provider "aws" {
  access_key = "AKIA6PGSMRXNEXH47GHN"
  secret_key = "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"
  region     = "eu-central-1"
}

module "init" {
  source = "../../modules/main"

  environment     = var.environment
  aws_region_main = var.aws_region_main
  tags            = var.tags
}