variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "zone_id" {
    default = "Z0127358DAMWNM9GTWB4"   
}

variable "domain_name" {
    default = "srikanth865.online"
}


variable "jenkins" {
    default = false #as we completed jenkins so we put false no need to create instance
}

variable "runner" {
    default = true
}