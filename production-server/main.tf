resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  
  tags = {
    Name        = var.server_name
    Team        = var.team
    CostCenter  = var.cost_center
    Environment = var.environment
  }
}

module "vpc-endpoints" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc//modules/vpc-endpoints"

}
