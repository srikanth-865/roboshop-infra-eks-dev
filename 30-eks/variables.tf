variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "eks_version" { #Eks version we kept as  1.35 Version
    default = "1.36"  
}


variable "enable_blue" {
    default = true
}

variable "blue_version" { 
    default = "1.36"
}

variable "enable_green" {  #we are giving true for create green node for 1st time running
    default = false    #firts time true
}

variable "green_version" {  #first running with 1.35 version
    default = "1.35"
}
