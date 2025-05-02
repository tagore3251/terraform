resource "aws_instance" "this" {
  for_each = var.instances # terraform will give us a variable called "each"
  ami                    = "ami-09c813fb71547fc4f" # This is joindevops AMI ID : devops-practice
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = each.value
  tags = {
    Name    = each.key
    Purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

output "ec2_info" {
  value = aws_instance.this
}