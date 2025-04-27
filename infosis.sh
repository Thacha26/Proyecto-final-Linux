#!/bin/bash

# Mostrar Memoria RAM
echo "📦 Memoria RAM Total:"
awk '/MemTotal/ {print $2/1024 " MB"}' /proc/meminfo

# Mostrar arquitectura del sistema
echo -e "\n🏗️  Arquitectura del sistema:"
uname -m

# Mostrar versión del sistema operativo
echo -e "\n🖥️  Versión del sistema operativo:"
awk -F= '/^PRETTY_NAME/ {gsub(/"/, "", $2); print $2}' /etc/os-release

