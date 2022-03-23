terraform {
  backend "s3" {
    region = "eu-central-1"

    bucket = "dev-private-global-transit-network-terraform-states"
    key    = "global/s3/terraform.tfstate"


    dynamodb_table = "dev-private-global-transit-network-terraform-up-and-running-locks"
    encrypt        = true
  }
}