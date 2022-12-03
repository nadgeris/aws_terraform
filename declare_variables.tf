variable "name" {
  type        = string
  description = "Name for the deployment"
  default     = ""
}

variable "namespace" {
  type        = string
  description = "Namespace for the deployment"
  default     = ""
}

variable "environment" {
  type        = string
  default     = ""
}


variable "hosted_zone_vpc_id" {
  description = "vpc id which associated to hosted zone"
  type = string
  default = ""
}

variable "zone" {
  type        = string
  description = "Name of the domain name to use"
  default     = ""
}

variable "region" {
  type        = string
  description = "region to deploy VPC into"
  default     = "us-east-2"
}



variable "subnets" {
  type    = list(any)
  default = []
}

variable "public_subnets" {
  type    = list(any)
  default = []
}


variable "vpc_id" {
  type    = string
  default = false
}
variable "vpc_cidr" {
  type    = string
  default = false
}


variable "second_octet" {
  description = "The second octet in an IPv4 Address, should be unique"
  type        = number
  default     = 0
}


variable "instance_type" {
  type        = string
  description = "AWS Instance type"
  default     = ""
}


variable "ssh_key" {
  type        = string
  description = "Name of SSH key to install "
  default     = ""
}

variable "private_subnet_id" {
  type    = list(any)
  default = []
}


variable "rds_endpoint" {
  type = string
  default = ""
  
}
variable "rds_password" {
  type = string
  default = ""
}

variable "app_resources" {
  type = map(any)
  default = {}
  
}