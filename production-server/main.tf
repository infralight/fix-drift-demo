terraform {
  backend "s3" {
    bucket         = "workflows-pre-ga-test-april-2024"
    key            = "production-server.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  subnet_id     = "subnet-095804f2ff2be589b"
  tags = {
    Name = "production-web"
    Team        = "platformmm"
    CostCenter  = "cc-1234"
    Environment = "production"
  }
}

resource "aws_iam_policy" "example" {
  name        = "example-policy"
  description = "Example IAM policy"
  policy      = data.aws_iam_policy_document.example.json
}
data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"
    
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    
    resources = [
      "arn:aws:s3:::my-bucket/*"
    ]
  }
}
