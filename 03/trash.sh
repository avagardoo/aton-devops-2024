# полезная нагрузка для триггера осноновных скриптов
TARGET_DIR="/root/aton-devops-2024/03/trash_files/"


while [ $(df $TARGET_DIR | awk '{print $5}' | sed 1d | sed 's/%//') -lt 85 ]
do
  dd if=/dev/zero of=$TARGET_DIR/trashfile$(date +%s) bs=1M count=1024
done
