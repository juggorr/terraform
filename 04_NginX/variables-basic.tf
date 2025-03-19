variable "region" {
  default = "ap-northeast-2"
}

variable "utm-ec2-ami" {
  default = "ami-0077297a838d6761d"
}

variable "web-ec2-ami" {
  default = "ami-0a998385ed9f45655"
}

variable "vpc-cidr" {
  default = "10.151.7.0/24"
}

variable "utm-ec2-public-eni-ip" {
  default = "10.151.7.4" 
}

variable "utm-ec2-private-eni-ip" {
  default = "10.151.7.68" 
}

variable "web-ec2-eni-ip" {
  default = "10.151.8.100"
}

variable "vpc-prod-cidr" {
  default = "10.151.8.0/24"
}