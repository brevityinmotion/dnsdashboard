# S3 bucket for website.
resource "aws_s3_bucket" "dashboard_bucket" {
  bucket = "dashboard.${var.dashboard_bucket_name}"
  acl = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = "dashboard.${var.dashboard_bucket_name}" })
  
  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
  }

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://dashboard.${var.dashboard_domain_name}"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = var.dashboard_tags
}