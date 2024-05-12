output "network_id" {
  value       = module.network.network_id
  description = "The ID of the created VPC network"
}

output "subnet_id" {
  value       = module.network.subnet_id
  description = "The ID of the created subnet"
}

output "disk_id" {
  value       = module.disk.disk_id
  description = "The ID of the created disk"
}

output "vm_id" {
  value       = module.compute.vm_id
  description = "The ID of the created virtual machine"
}
