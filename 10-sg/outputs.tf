output "sg_id"{
    value = module.sg[count.index].sg_id
}