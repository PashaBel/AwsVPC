terraform {
  backend "s3"{
    access_key = "AKIA6PGSMRXNEXH47GHN"
    secret_key = "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"
    region     = "eu-central-1"
    
    bucket = "dev-private-global-transit-network-terraform-states"
    key = "global/s3/terraform.tfstate"

    
    dynamodb_table = "dev-private-global-transit-network-terraform-up-and-running-locks"
    encrypt = true
  }
}