variable "bucket_name" {
    description = "Enter your Bucket Name"
    type = string
  
}

variable "acl" {
    description = "Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write. Defaults to private"
    type = string
    default = "private"
}

variable "versioning" {
    description = "versionin enabled true or false. Defaults to true"
    type = bool
    default = true
}

variable "website" {
    description = "Map containing static web-site hosting or redirect configuration."
    type        = map(string)
    default     = {}
}

variable "lifecycle_rule" {
    description = "value"
    type = any
    default = []
  
}

variable "tags" {
    description = "Enter your tags"
    type = map
    default = {}
}

