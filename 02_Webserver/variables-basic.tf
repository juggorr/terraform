variable "region" {
  default = "ap-northeast-2"
}

variable "utm-ec2-ami" {
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

variable "ec2-juggorr-share-svr-eni-ip" {
  default = "10.151.7.100"
}