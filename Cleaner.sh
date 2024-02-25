#!/bin/bash

# Borrar caché del sistema
sudo sync; echo 3 | sudo tee /proc/sys/vm/drop_caches

# Borrar caché de la memoria RAM
sudo sysctl -w vm.drop_caches=3

# Borrar caché de la memoria swap
sudo swapoff -a && sudo swapon -a

# Borrar caché de Google Chrome
find ~/.cache/google-chrome -mindepth 1 -delete

# Borrar historial de Google Chrome
find ~/.config/google-chrome -name "History" -delete

# Borrar archivos temporales
find /tmp -type f -delete

# Borrar paquetes no utilizados
apt-get autoremove -y

# Borrar logs antiguos
find /var/log -mtime +7 -delete

# Agendar la tarea para que se ejecute cada semana
sudo bash -c "echo '@weekly /bin/bash /ruta/al/script' >> /etc/crontab"
