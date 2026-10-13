module "vpc"{
    source = "git::https://github.com/srikanth-865/vpc-source-practice.git?ref=main" #it refer from this directory vpc-source-practice
    project = var.project
    environment = var.environment
}
