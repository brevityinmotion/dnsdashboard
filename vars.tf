variable "aws_region" {
    description = "AWS region to use for resource deployment."
    default = "us-east-1"
}
variable "aws_account_id" {
    default = "000017942944"
}
variable "aws_prefix" {
    default = "brevity"
}
variable "terraform_bucket" {
    default = "brevity-terraform"
}
variable "dashboard_tags" {
    type        = map
    description = "A mapping of tags to a resource."
    default     = {
        project = "brevityinmotion"
        terraform   = "true"
    }
}
variable "dashboard_domain_name" {
  type = string
  description = "The domain name for the dashboard site."
}

variable "dashboard_bucket_name" {
  type = string
  description = "The name of the bucket for the site. Typically the domain name."
}