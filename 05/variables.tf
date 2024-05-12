variable "yandex_token" {
  type        = string
  description = "Yandex Cloud API token"
}

variable "yandex_cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "yandex_folder_id" {
  type        = string
  description = "Yandex Folder ID"
}

variable "platform_id" {
  type        = string
  description = "The type of virtual machine to create"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone for resources"
}

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

variable "disk_name" {
  type        = string
  description = "Name of the additional disk"
}

variable "disk_size" {
  type        = number
  description = "Size of the additional disk in GB"
}

variable "disk_type" {
  type        = string
  description = "Type of the additional disk"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_cores" {
  type        = number
  description = "Number of cores for the virtual machine"
}

variable "vm_memory" {
  type        = number
  description = "Amount of memory for the virtual machine"
}

variable "vm_disk_type" {
  type        = string
  description = "Type of the virtual machine boot disk"
}

variable "vm_disk_size" {
  type        = number
  description = "Size of the virtual machine boot disk in GB"
}

variable "vm_image_id" {
  type        = string
  description = "ID of the virtual machine image"
}
