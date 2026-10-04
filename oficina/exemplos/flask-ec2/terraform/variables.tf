variable "aws_region" {
  description = "Região autorizada no Learner Lab."
  type        = string
}

variable "student_id" {
  description = "Identificador técnico único da equipe, sem dados pessoais."
  type        = string
}

variable "vpc_id" {
  description = "VPC existente e autorizada no laboratório."
  type        = string
}

variable "subnet_id" {
  description = "Sub-rede existente que oferece IP público."
  type        = string
}

variable "ami_id" {
  description = "AMI Amazon Linux 2023 validada para a região."
  type        = string
}

variable "instance_type" {
  description = "Tipo de instância permitido e conferido quanto a custo."
  type        = string
}

variable "operator_cidr" {
  description = "IP público do operador, em CIDR /32, autorizado para SSH e HTTP do laboratório."
  type        = string
}

variable "public_key" {
  description = "Chave SSH pública do laboratório; nunca informar a privada."
  type        = string
}
