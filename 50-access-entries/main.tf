#for this entry accept permissions for whatever we set bastion for  IAM ROle permissions cluster adminpolicy
resource "aws_eks_access_entry" "bastion" { #Register the Bastion role
  cluster_name      = local.eks_cluster_name
  principal_arn     = local.bastion_iam_role_arn
  type              = "STANDARD"
}
#Here we set cluster level admin policy
resource "aws_eks_access_policy_association" "bastion" {
  cluster_name  = local.eks_cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = local.bastion_iam_role_arn

  access_scope {
    type       = "cluster"
  }
  depends_on = [
    aws_eks_access_entry.bastion
  ]
}
 