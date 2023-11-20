variable "subnet_range" {
  type        = string
  description = "range subnet"

  default = "10.0.0.0/24"
}

variable "region" {
  type        = string
  description = "the vpc region"

  default = "us-east-1"
}

variable "vpc_range" {
  type        = string
  description = "range subnet"

  default = "10.0.0.0/22"
}
