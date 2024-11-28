variable "ami" {
    type = string
    default = ""
  
}

variable "instance_type" {
     type = string
    default = ""
  
}

variable "key_name" {
     type = string
    default = ""
  
}


variable "mylist" {
    type = list(string)
    default = [ "sai","venky","devi" ]
}

