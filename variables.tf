variable "vpc_cidr" {
  description = "Choose cidr for vpc"
  type        = "string"
  default     = "10.20.0.0/16"
}

variable "region" {
  description = "Choose region for the stack"
  type        = "string"
  default     = "us-east-1"
}

variable "web_ec2_count" {
  description = "Choose number of ec2 instances for web"
  type        = "string"
  default     = "2"
}

variable "web_amis" {
  type        = "map"
  default     = {
    us-east-1 = "ami-0947d2ba12ee1ff75"
    us-east-2 = "ami-03657b56516ab7912"
  }
}

variable "web_instance_type" {
  description = "Choose instance type for your web"
  type        = "string"
  default     = "t2.micro"
}

variable "my_rs3_bucket" {
  type        = "string"
  default     = "ragdemos3"
}

variable "web_tags" {
  type        = "map"
  default     = {
    name      = "webserver"
  }
}
