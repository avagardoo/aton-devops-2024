terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone      = var.zone
}

module "compute" {
  source = "./modules/compute"

  vm_name            = var.vm_name
  platform_id        = var.platform_id
  zone               = var.zone
  vm_cores           = var.vm_cores
  vm_memory          = var.vm_memory
  vm_disk_type       = var.vm_disk_type
  vm_disk_size       = var.vm_disk_size
  vm_image_id        = var.vm_image_id
  subnet_id          = module.network.subnet_id
  additional_disk_id = module.disk.disk_id
}

module "network" {
  source = "./modules/network"

  zone         = var.zone
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "disk" {
  source = "./modules/disk"

  disk_name = var.disk_name
  disk_size = var.disk_size
  disk_type = var.disk_type
}
