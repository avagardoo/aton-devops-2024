variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}
variable "platform_id" {
  type        = string
  description = "The type of virtual machine to create. The default is 'standard-v1"
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
  description = "Type Disk"
}

variable "vm_disk_size" {
  type        = number
  description = "Size of the boot disk for the virtual machine"
}

variable "vm_image_id" {
  type        = string
  description = "ID of the image for the virtual machine"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach the virtual machine"
}

variable "additional_disk_id" {
  type        = string
  description = "ID of the additional disk to attach to the virtual machine"
}
variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone for resources"
}
