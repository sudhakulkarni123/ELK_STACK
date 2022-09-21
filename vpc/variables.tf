variable "vpc_name" {
  description = "This is the vpc name"
  type        = string
}

variable "vpc_cidr" {
  description = "This is cidr for vpc"
}

variable "cidr_public" {
  description = "This is cidr for public_a"
}


variable "cidr_private_a" {
  description = "This is cidr for private_a"
}

variable "cidr_private_b" {
  description = "This is cidr for private_b"
}

variable "cidr_private_c" {
  description = "This is cidr for private_c"
}
