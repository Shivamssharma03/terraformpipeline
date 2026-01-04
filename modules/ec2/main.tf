resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = (var.public_key)
}

resource "aws_security_group" "ssh" {
  name = "${var.env}-ssh"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name        = "${var.env}-ec2"
    Environment = var.env
  }
}
