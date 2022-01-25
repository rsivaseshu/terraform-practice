variable "tags" {
  description = "enter your tags"
  type        = map(any)
  default = {
    CostCenter = "123"
    Project    = "sample"
    Owner      = "Owner"
  }

}