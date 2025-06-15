output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "kubeconfig" {
  value = aws_eks_cluster.this.endpoint
}

output "ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}
