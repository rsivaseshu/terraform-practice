variable "ami_id" {
    type = string
    default = "ami-04505e74c0741db8d"
  
}

variable "instance_type"{
    type = map
    default = {
        dev = "t2.micro"
        test = "t3.micro"
    }
    description = "instance type mapping depends on env"
}

variable "instance_count" {
    type = number
    default = 2
}

variable "env" {
    type = string
    description = "enter your environment name"
}