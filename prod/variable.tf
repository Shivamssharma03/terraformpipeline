variable "ami_id" {
  description = "AMI ID for dev EC2"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "public_key" {
  description = "Public SSH key for EC2 instance"
  type        = string
}


