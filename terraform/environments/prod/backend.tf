terraform {
  backend "s3" {
    bucket     = "prod-private-global-transit-network-terraform-states"
    key        = "global/s3/terraform.tfstate"
    access_key = "AKIA2BP6DKSP5SW5YFRP"
    secret_key = "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"
    region     = "eu-central-1"

    dynamodb_table = "prod-private-global-transit-network-terraform-up-and-running-locks"
    encrypt        = true
  }
}