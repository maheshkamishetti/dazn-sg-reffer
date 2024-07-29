variable "common_tags" {
  default = {
    Project     = "live"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "sg_tags" {
  default = {}
}

variable "project_name" {
  default = "live"
}
variable "environment" {
  default = "dev"
}

# variable "ssh_cidrs" {
#    type        = list(string)
#     default = "110.235.236.252/32"
  
# }