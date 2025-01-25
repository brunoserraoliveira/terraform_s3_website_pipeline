resource "aws_s3_bucket" "website_bucket" {
  bucket = "formacao-devops-bruno-oliveira"
  tags = {
    Name        = "FORMAÇÃO DEVOPS"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "website_public_access_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "website_versioning" {
  bucket = aws_s3_bucket.website_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = data.aws_iam_policy_document.website_allow_public_access.json
}

data "aws_iam_policy_document" "website_allow_public_access" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.website_bucket.arn}/*"
    ]
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  content_type = "text/html; charset=utf-8"
  source       = "site/index.html"
  etag         = filemd5("site/index.html")
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "error.html"
  content_type = "text/html; charset=utf-8"
  source       = "site/error.html"
  etag         = filemd5("site/error.html")
}

resource "aws_s3_object" "terraform_logo" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "logos/terraform.png"
  content_type = "image/png"
  source       = "site/logos/terraform.png"
  etag         = filemd5("site/logos/terraform.png")
}

resource "aws_s3_object" "aws_logo" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "logos/aws.png"
  content_type = "image/png"
  source       = "site/logos/aws.png"
  etag         = filemd5("site/logos/aws.png")
}

resource "aws_s3_object" "github_actions_logo" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "logos/github-actions.png"
  content_type = "image/png"
  source       = "site/logos/github-actions.png"
  etag         = filemd5("site/logos/github-actions.png")
}
