#!/bin/bash

# Script de instalación y configuración de Apache Tomcat en Linux
# Basado en el tutorial de Cesc Sierra y Oriol Ferrer

echo "1. Instalando Java..."
sudo apt update
sudo apt install -y default-jdk

echo "2. Comprobando versión de Java..."
java -version

echo "3. Creando grupo y usuario para Tomcat..."
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

echo "4. Descargando Tomcat..."
cd /tmp
TOMCAT_VERSION=10.1.18
wget https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

echo "5. Instalando Tomcat en /opt/tomcat..."
sudo mkdir -p /opt/tomcat
sudo tar xzvf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt/tomcat --strip-components=1

echo "6. Ajustando permisos de Tomcat..."
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod -R u+x /opt/tomcat/bin

echo "7. Creando servicio systemd para Tomcat..."
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

echo "8. Recargando systemd y habilitando Tomcat..."
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat

echo "9. Verificando estado de Tomcat..."
sudo systemctl status tomcat

echo "Accede via navegador a: http://<TU_IP_PUBLICA>:8080"

