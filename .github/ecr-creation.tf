terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "Fred-EKS-Cluster"
  cluster_version = "1.27"
  vpc_id          = "vpc-07b02875b34c1fc99"

  subnet_ids = [
    "subnet-002e52f12ca5193d2", # us-east-1a
    "subnet-00ba46dda8362ada7"  # us-east-1b
  ]

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = 3
      max_capacity     = 4
      min_capacity     = 2

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
