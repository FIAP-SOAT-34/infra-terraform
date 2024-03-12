variable "aws_region" {
  description = "The AWS region where the resources will be created."
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  default     = "TechChallengeCluster"
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  default     = "tech-challenge-repository"
}
