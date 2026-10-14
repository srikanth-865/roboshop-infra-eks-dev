variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "eks_version" { #Eks version also 1.35
    default = "1.35"  
}


variable "enable_blue" {
    default = false
}

variable "blue_version" { 
    default = "1.34"
}

variable "enable_green" {  #we are giving true for create green node for 1st time running
    default = true
}

variable "green_version" {  #first running with 1.35 version
    default = "1.35"
}
