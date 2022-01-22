variable "tags" {
  type = map(object({
    Owner      = string
    CostCenter = number
    project    = string
    env        = string
  }))
  default = {
    "key" = {
      CostCenter = 123
      Owner      = "siva"
      env        = "dev"
      project    = "my-self"
    }
  }

}

variable "user_name" {
    type = string
    default = "siva"
  
}

variable "project" {
    type = string
    default = ""
  
}