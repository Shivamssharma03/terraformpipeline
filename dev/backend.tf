terraform {
  backend "s3" {
    bucket         = "shivamterraformstate12345"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
