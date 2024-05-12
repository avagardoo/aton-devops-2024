variable "disk_name" {
  type        = string
  default     = "additional-disk"
  description = "Name of the additional disk"
}

variable "disk_type" {
  type        = string
  description = "Type of the additional disk"
}

variable "disk_size" {
  type        = number
  description = "Size of the additional disk in GB"
}
