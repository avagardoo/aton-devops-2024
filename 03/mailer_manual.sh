#!/bin/bash

# Параметры SMTP
read -p "Введите SMTP сервер и порт (например, [smtp.gmail.com]:587 ): " SMTP_SERVER
read -sp "Введите email для аутентификации на SMTP сервере: " SMTP_USER
echo
read -sp "Введите пароль для аутентификации на SMTP сервере: " SMTP_PASSWORD
echo
read -sp "Введите адрес электронной почты получателя уведомлений: " NOTIFICATION_EMAIL
echo

# Путь к файлу sasl_passwd
SASL_FILE="/etc/postfix/sasl/sasl_passwd"
SASL_FILE_POSTMAP="/etc/postfix/sasl/sasl_passwd.db"

# Порог предупреждения
THRESHOLD_WARNING=85

# Обновление файла sasl_passwd и конфигурации Postfix
echo "$SMTP_SERVER $SMTP_USER:$SMTP_PASSWORD" > $SASL_FILE
postmap $SASL_FILE && echo "Postmap successfully completed" || echo "Postmap error"
chown root:root $SASL_FILE $SASL_FILE_POSTMAP
chmod 0600 $SASL_FILE $SASL_FILE_POSTMAP

# Конфигурирование  и перезагрузка Postfix
postconf -e "relayhost = $SMTP_SERVER"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_sasl_password_maps = hash:$SASL_FILE"
postconf -e "smtp_tls_security_level = encrypt"
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
systemctl restart postfix && echo "Postfix reloaded successfully" || echo "Error when rebooting Postfix"

# Функция отправки алерта
send_notification() {
    local subject="WARNING ALERT: \"${HOSTNAME}\" Critical Disk Usage"
    local body="Attention:\n\nDisk usage on host \"${HOSTNAME}\" is being checked.\n\n:: CHECK CONDITION\n-- Warning if disk usage is above: ${THRESHOLD_WARNING}%\n:: CHECKING DISK\n-- Disk to check: /dev/sda1\n${mail_content}\n\n--\nServer:\n$HOSTNAME"
    local to_email="${NOTIFICATION_EMAIL}"
    local from_email="${SMTP_USER}"

    echo -e "From: ${from_email}\nTo: ${to_email}\nSubject: ${subject}\n\n${body}" | sendmail -t
    if [ $? -eq 0 ]; then
        echo "Alert successfully sent."
    else
        echo "Error sending alert."
    fi
}

# Проверка дискового пространства
check_disk_space() {
    local disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

    if (( disk_usage > THRESHOLD_WARNING )); then
        mail_content="=> Disk usage is above the warning threshold: ${disk_usage}%"
        send_notification
    else
        mail_content="=> Disk usage is below the warning threshold: ${disk_usage}%"
        echo "Disk usage is below ${THRESHOLD_WARNING}%. Current usage: ${disk_usage}%."
    fi
}


# Запуск проверки дискового пространства
check_disk_space
