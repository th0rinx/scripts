#!/bin/bash

# Script para instalar y configurar Fail2Ban en Ubuntu 20.04

# Función para verificar si un comando se ejecuta correctamente
check_command() {
    if [ $? -ne 0 ]; then
        echo "[ERROR] $1 falló. Saliendo del script."
        exit 1
    fi
}

echo "Actualizando repositorios y paquetes..."
sudo apt update && sudo apt upgrade -y
check_command "Actualización del sistema"

echo "Instalando Fail2Ban..."
sudo apt install fail2ban -y
check_command "Instalación de Fail2Ban"

echo "Creando archivo de configuración jail.local..."
cat << 'EOF' | sudo tee /etc/fail2ban/jail.local
[DEFAULT]

bantime  = 10m
findtime = 10m
maxretry = 3
backend  = auto

[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 1
findtime = 3600
bantime = 86400  # 24 hours#
backend = %(sshd_backend)s

[recidive]
logpath  = /var/log/fail2ban.log
banaction = %(banaction_allports)s
bantime  = 1w
findtime = 1d
EOF
check_command "Creación de jail.local"

echo "Habilitando y reiniciando el servicio Fail2Ban..."
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
check_command "Reinicio de Fail2Ban"

echo "Comprobando el estado de Fail2Ban..."
sudo systemctl status fail2ban | head -10

echo "Configuración completada. Verifica Fail2Ban con el comando: sudo fail2ban-client status"
