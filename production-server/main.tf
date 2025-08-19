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
    Team        = "platform"
    CostCenter  = "cc-1234"
    Environment = "production"
  }
}
