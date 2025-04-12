provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secrets_key
}

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secrets_key
  }
}

variable "access_key" {
  type = string
}
variable "secrets_key" {
  type = string
}

#VPC BLOCK
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id.main
  tags = {
    Name = "main"
  }
}

###AWS SUBNET
resource "aws_subnet" "public" {
  vpc_id                   = aws_vpc.main.id.main
  cidr_block               = "10.0.1.0/24"
  map_public_ip_on_launch  = true
  tags = {
    Name = "public-subnet"
  }
}


#Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id.main
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "private-subnet"
  }
}
