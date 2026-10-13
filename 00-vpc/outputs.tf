output "vpc_id"{
    value = module.vpc.vpc_id
}

output "public_subnet_ids"{
    value = module.vpc.public_subnet_ids  #we take outputs with module along with name.taking output names
}

output "private_subnet_ids"{
    value = module.vpc.private_subnet_ids
}

output "database_subnet_ids"{
    value = module.vpc.database_subnet_ids
}