#!/bin/bash

#########################################################

clear

echo -e "\e[32m\e[0m"
echo -e "\e[32m ________      ___    ___      ________  ________  ________     \e[0m"
echo -e "\e[32m|\   __  \    |\  \  /  /|    |\   __  \|\   __  \|\   __  \    \e[0m"
echo -e "\e[32m\ \  \|\ /_   \ \  \/  / /    \ \  \|\  \ \  \|\  \ \  \|\  \   \e[0m"
echo -e "\e[32m \ \   __  \   \ \    / /      \ \   _  _\ \   ____\ \   __  \  \e[0m"
echo -e "\e[32m  \ \  \|\  \   \/  /  /        \ \  \\  \\ \  \___|\ \  \ \  \ \e[0m"
echo -e "\e[32m   \ \_______\__/  / /           \ \__\\ _\\ \__\    \ \__\ \__\e[0m"
echo -e "\e[32m    \|_______|\___/ /             \|__|\|__|\|__|     \|__|\|__|\e[0m"
echo -e "\e[32m             \|___|/                                            \e[0m"
echo -e "\e[32m                          BY RPA                                      \e[0m"
echo -e "\e[32m                  AUTOR ==> CARLOS FRAZÃO <==                           \e[0m"
echo -e "\e[32m\e[0m"

#########################################################

echo ""
echo -e "\e[32m==============================================================================\e[0m"
echo -e "\e[32m=                                                                            =\e[0m"
echo -e "\e[32m=                 \e[33mINSTALAÇÃO DAS FERRAMENTAS\e[32m                 =\e[0m"
echo -e "\e[32m=                                                                            =\e[0m"
echo -e "\e[32m==============================================================================\e[0m"
echo ""

######################################################################

# Atualiza os repositórios
sudo apt-get update

# Realiza a atualização do sistema
sudo apt-get upgrade -y

######################################################################

clear

echo ""
read -p "Digite a versão da sua escolha para o Node.js (ex:'18') " versionn
echo ""

# Adiciona o repositório Node.js
sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg

echo "deb https://deb.nodesource.com/node_$versionn.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Atualiza os repositórios após adicionar o repositório do Node.js
sudo apt-get update

# Instala o Node.js
sudo apt-get install nodejs -y

# Atualiza o npm
sudo npm install -g npm@latest --force

# Instala o PM2
sudo npm install -g pm2@latest --force

# Instala ferramentas úteis
sudo apt-get install -y git zip unzip nload snapd curl wget sudo

# Define o fuso horário
sudo timedatectl set-timezone America/Sao_Paulo

# Instala o Docker Compose
sudo apt-get install docker-compose -y

# Instala o Nginx
sudo apt-get install nginx -y

# Instala o Certbot e o plugin para o Nginx
sudo apt-get install certbot python3-certbot-nginx -y

# Instala o Certbot via Snap (opcional)
sudo snap install --classic certbot

# Remove a configuração padrão do Nginx
sudo rm /etc/nginx/sites-enabled/default

#######################################################

cd

cd /etc/nginx/

# Remova o arquivo nginx.conf se ele existir
sudo rm -f nginx.conf

# Crie o arquivo nginx.conf com o conteúdo desejado automaticamente
sudo tee nginx.conf > /dev/null <<EOL

user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 65;
        types_hash_max_size 2048;
        # server_tokens off;

        server_names_hash_bucket_size 256;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
EOL

# Atualiza os repositórios
sudo apt-get update

# Realiza a atualização do sistema
sudo apt-get upgrade -y

sudo systemctl reload nginx

# Reinicia o serviço Nginx
sudo systemctl restart nginx

#######################################################

cd

clear

cd /home/ubuntu/instalador_T_N_E_W_C_

# Retorna para o instalador.sh
# Exibe uma mensagem de confirmação
read -p "Deseja voltar para o MENU PRINCIPAL? (Y/N): " choice

# Verifica a escolha do usuário
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
  sudo chmod +x instalador.sh && ./instalador.sh
  echo "Comando executado."
elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
  echo "Comando não executado. Continuando..."
else
  echo "Escolha inválida. Saindo."
fi
