terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "lab" {
  key_name   = "epic-${var.student_id}"
  public_key = var.public_key

  tags = {
    Project = "epic-devops-oficina"
  }
}

resource "aws_security_group" "app" {
  name        = "epic-${var.student_id}-app"
  description = "Acesso temporario a aplicacao de laboratorio"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH do operador"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.operator_cidr]
  }

  ingress {
    description = "HTTP de laboratorio"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.operator_cidr]
  }

  egress {
    description = "Saida para instalacao e atualizacoes do laboratorio"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "epic-devops-oficina"
  }
}

resource "aws_instance" "app" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.app.id]
  key_name                    = aws_key_pair.lab.key_name

  user_data = <<-EOF
    #!/bin/bash
    set -euxo pipefail
    dnf install -y docker
    systemctl enable --now docker
    usermod -aG docker ec2-user
  EOF

  tags = {
    Name    = "epic-${var.student_id}"
    Project = "epic-devops-oficina"
  }
}
