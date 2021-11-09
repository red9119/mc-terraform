variable "public_subnet_numbers" {
  type = map(number) 
  default = {
    "us-east-2a" = 1
    "us-east-2b" = 2
    "us-east-2c" = 3
  }
}
 
variable "private_subnet_numbers" {
  type = map(number) 
  default = {
    "us-east-2a" = 4
    "us-east-2b" = 5
    "us-east-2c" = 6
  }
}
 
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}
 
variable "infra_env" {
  type        = string
}