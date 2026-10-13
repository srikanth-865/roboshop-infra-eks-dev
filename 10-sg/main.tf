module "sg" {
    count = length(var.sg_names) #here we give count so it will go in list wise
    source = "git::https://github.com/srikanth-865/terraform-sg-practice.git?ref=main"
    project = var.project
    environment =  var.environment
    sg_name = var.sg_names[count.index]
    vpc_id = local.vpc_id
}