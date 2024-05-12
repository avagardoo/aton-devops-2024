terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_disk" "disk" {
  name = var.disk_name
  type = var.disk_type
  size = var.disk_size
}
