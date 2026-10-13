data "aws_ssm_parameter" "public_alb_sg_id" {
  name = "/${var.project}/${var.environment}/public_alb_sg_id"
}
data "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
    name = "/${var.project}/${var.environment}/eks_control_plane_sg_id"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
    name = "/${var.project}/${var.environment}/eks_node_sg_id"
}
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

