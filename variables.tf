variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "Nome do bucket (must be globally unique)."
  default     = "infra-prova-${random_id.suffix.hex}"
}
