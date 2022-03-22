terraform {
    backend "s3" {
        bucket = "brevity-terraform"
        key = "ipinfo/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}