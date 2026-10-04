variable "aws_region" {
  description = "Região autorizada no Learner Lab."
  type        = string
}

variable "bucket_name" {
  description = "Nome globalmente único do bucket de laboratório."
  type        = string
}

variable "enable_public_website" {
  description = "Ativar somente após confirmar permissão de acesso público no laboratório."
  type        = bool
  default     = false
}
