variable "region" {}
variable "vpc-name" {}
variable "vpc-cidr-block" {}
variable "az-1" {}
variable "az-2" {}
variable "pub-cidr-az-1" {}
variable "pub-cidr-az-2" {}
variable "priv-cidr-az-1" {}
variable "priv-cidr-az-2" {}
variable "db-username" {}
variable "db-password" {}
variable "key_name" {}

variable "ec2-config" {
  description = "Configuration for EC2 instances"
  type        = map(string)

  default = {
    instance-type = "t2.micro"
    ami           = "ami-06b21ccaeff8cd686"
    user_data     = "user-data.sh"
  }
}

