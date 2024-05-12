yandex_token     = "" # https://yandex.cloud/ru/docs/iam/concepts/authorization/oauth-token
yandex_cloud_id  = "" # https://yandex.cloud/ru/docs/resource-manager/operations/cloud/get-id
yandex_folder_id = "" # https://yandex.cloud/ru/docs/resource-manager/operations/folder/get-id


zone = "ru-central1-a" # default for all


platform_id  = "standard-v3" # Платформа Intel Broadwell (standard-v1), Платформа Intel Cascade Lake (standard-v2), Платформа Intel Ice Lake (standard-v3).
vm_name      = "aton-virtual-machine"
vm_cores     = 4
vm_memory    = 4
vm_image_id  = "fd87j6d92jlrbjqbl32q" # Ubuntu 22.04 LTS
vm_disk_size = 40 # boot_disk
vm_disk_type = "network-ssd"


disk_name = "aton-disk"
disk_size = 40
disk_type = "network-ssd"


network_name = "aton-network"
subnet_name  = "aton-subnet"
subnet_cidr  = ["10.0.1.0/24"]
