terraform {
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.54.0"
    }
  }

  backend "s3" {
    bucket = "tech-challenge-grupo34"
    key    = "tech-challenge/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "taskVPC"
  }
}

# Create  subnets
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]

  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "PublicSubnet${count.index + 1}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Create an EKS cluster
# resource "aws_eks_cluster" "my_eks_cluster" {
#   name     = var.eks_cluster_name
#   role_arn = aws_iam_role.eks_cluster.arn

#   vpc_config {
#     subnet_ids = aws_subnet.public_subnets[*].id
#   }
# }

# # Create an IAM role for EKS cluster
# resource "aws_iam_role" "eks_cluster" {
#   name = "eks-cluster-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# # Attach policies to the IAM role for EKS cluster
# resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks_cluster.name
# }

# # Create an Elastic Container Registry (ECR)
# resource "aws_ecr_repository" "my_ecr_repository" {
#   name = var.ecr_repository_name

#   image_tag_mutability = "MUTABLE"
#   image_scanning_configuration {
#     scan_on_push = false
#   }
# }