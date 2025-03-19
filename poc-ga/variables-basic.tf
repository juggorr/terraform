variable "region" {
  default = "us-west-2"
}

variable "my-pc-ip" {
  default = "165.243.5.20/32"
}

variable "vpc-cidr" {
  default = "10.0.0.0/24"
}

variable "sbn-cidr" {
  default = "10.0.0.0/27"
}

variable "az-1-number" {
  default = 0
}

variable "svr-ami" {
  default = "ami-0d31ac04c1d894d66"
}