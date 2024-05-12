output "network_id" {
  value       = yandex_vpc_network.network.id
  description = "The ID of the created VPC network"
}

output "subnet_id" {
  value       = yandex_vpc_subnet.subnet.id
  description = "The ID of the created subnet"
}
