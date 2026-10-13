# mongodb is allowing connection from bastion on port 22
resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
source_security_group_id = local.bastion_sg_id
security_group_id = local.mongodb_sg_id
}


# redis is allowing connection from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
source_security_group_id = local.bastion_sg_id
security_group_id = local.redis_sg_id
}

# MySQL is allowing connection from bastion on port 22
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}


#rabbitmq is allowing connection from bastion on port 22
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}

resource "aws_security_group_rule" "public_alb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.public_alb_sg_id
}

# Frontend ALB
resource "aws_security_group_rule" "public_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.public_alb_sg_id
}

resource "aws_security_group_rule" "bastion_my_public_ip" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"] #we are taking myip address
  #source_security_group_id = local.vpn_sg_id
  security_group_id = local.bastion_sg_id
}

# EKS Control plane should accept traffic from Bastion
resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.eks_control_plane_sg_id
}
#EKs node should accept traffice from control plane
resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # All traffic all nodes
  source_security_group_id = local.eks_control_plane_sg_id
  security_group_id = local.eks_node_sg_id
}
#Both are trusting  control plane should accept from node ..for one to one both accept traffic one by one
resource "aws_security_group_rule" "eks_control_plane_eks_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # All traffic
  source_security_group_id = local.eks_node_sg_id
  security_group_id = local.eks_control_plane_sg_id
}

# Internal traffic of VPC for one pod to another pod communication  
resource "aws_security_group_rule" "eks_node_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" # All traffic
  cidr_blocks = ["10.0.0.0/16"] #its our vpc cidr
  security_group_id = local.eks_node_sg_id
}
