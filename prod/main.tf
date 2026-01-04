provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source           = "../modules/ec2"
  env              = "prod"
  ami_id           = var.ami_id
  instance_type    = "t3.small"
  key_name         = var.key_name
  public_key       = var.public_key
  allowed_ssh_cidr = ["0.0.0.0/0"]
}
