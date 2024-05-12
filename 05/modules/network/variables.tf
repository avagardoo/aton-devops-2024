variable "network_name" {
  type        = string
  description = "Name of the network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_cidr" {
  type        = list(string)
  description = "CIDR block for the subnet"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone for resources"
}