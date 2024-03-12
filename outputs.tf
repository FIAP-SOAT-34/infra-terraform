// Outputs subnets to be used in db repository
output "subnet1_id" {
   value       = aws_subnet.subnet1.id
   description = "The ID subnet 1"
}

output "subnet2_id" {
   value       = aws_subnet.subnet2.id
   description = "The ID subnet 2"
}

# output "eks_cluster_endpoint" {
#   value       = aws_eks_cluster.my_eks_cluster.endpoint
#   description = "The EKS cluster endpoint URL."
# }

# output "eks_cluster_security_group_ids" {
#   value       = aws_eks_cluster.my_eks_cluster.vpc_config[0].security_group_ids
#   description = "The security group IDs associated with the EKS cluster."
# }

# output "ecr_repository_url" {
#   value       = aws_ecr_repository.my_ecr_repository.repository_url
#   description = "The URL of the ECR repository."
# }