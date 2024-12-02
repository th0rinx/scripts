# scripts
Scripts Varios

*10Ene22 - Eliminar Usuarios Duplicados* // **BASH - LDAP**


## fail2ban.sh
Actualiza el sistema:

Realiza apt update y apt upgrade para asegurarse de que los repositorios y paquetes estén actualizados.

Instala Fail2Ban:

Usa apt install fail2ban para instalar el software.

Configura Fail2Ban:

Crea el archivo /etc/fail2ban/jail.local con la configuración que me proporcionaste, asegurándose de habilitar las protecciones para sshd y recidive.

Habilita y reinicia el servicio:

Activa el servicio Fail2Ban para que se inicie automáticamente al arrancar el sistema.

Reinicia el servicio para aplicar la configuración.

Muestra el estado del servicio:

Usa systemctl status fail2ban para verificar que Fail2Ban esté funcionando
