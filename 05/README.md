```bash
ssh-keygen -t rsa # для доступа по ssh к будущей vm "~/.ssh/id_rsa.pub"
cd aton-devops-2024/05
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash # yandex cloud CLI 
exec -l $SHELL
yc config set service-account-key key.json # https://yandex.cloud/ru/docs/iam/concepts/authorization/key
yc config set cloud-id <идентификатор_облака> # https://yandex.cloud/ru/docs/resource-manager/operations/cloud/get-id
yc config set folder-id <идентификатор_каталога> # https://yandex.cloud/ru/docs/resource-manager/operations/folder/get-id
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

terraform init

terraform plan

terraform apply

yes


terraform destroy
```
