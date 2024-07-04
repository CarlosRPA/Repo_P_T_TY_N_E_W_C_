#!/bin/bash

#########################################################

clear

echo -e "\e[32m

        ██████╗ ██╗   ██╗    ██████╗ ██████╗  █████╗ 
        ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔══██╗██╔══██╗
        ██████╔╝ ╚████╔╝     ██████╔╝██████╔╝███████║
        ██╔══██╗  ╚██╔╝      ██╔══██╗██╔═══╝ ██╔══██║
        ██████╔╝   ██║       ██║  ██║██║     ██║  ██║
        ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝\e[0m"
echo -e "\e[32m                          BY RPA                                      \e[0m"
echo -e "\e[32m                  AUTOR ==> CARLOS FRAZÃO <==                           \e[0m"
echo -e "\e[32m\e[0m"

#########################################################

echo ""
echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ║  \033[34m            INSTALAÇÃO DAS FERRAMENTAS                \033[31m║\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
echo ""

######################################################################

cd

# Atualiza os repositórios
sudo apt-get update

# Realiza a atualização do sistema
sudo apt-get upgrade -y

######################################################################

clear

echo ""
read -p "Digite a versão da sua escolha para o Node.js (ex:'20') " versionn
echo ""

# Adiciona o repositório Node.js
sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg

echo "deb https://deb.nodesource.com/node_$versionn.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Atualiza os repositórios após adicionar o repositório do Node.js
sudo apt-get update

######################################################################

cd

# Instala ferramentas úteis
sudo apt-get install -y git zip unzip nload snapd curl wget sudo

######################################################################

# Define o fuso horário
sudo timedatectl set-timezone America/Sao_Paulo

######################################################################

# Instala o Docker Compose
sudo apt-get install docker-compose -y

######################################################################

cd

# Instala o Nginx
sudo apt-get install nginx -y
sudo systemctl start nginx
systemctl enable nginx
systemctl status nginx

# Remove a configuração padrão do Nginx
sudo rm /etc/nginx/sites-enabled/default

######################################################################

cd

# Instala o Certbot e o plugin para o Nginx
sudo apt-get install certbot python3-certbot-nginx -y

# Instala o Certbot via Snap (opcional)
sudo snap install --classic certbot

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

#######################################################

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

cd /home/install_P_T_TY_N_E_W_C_/Servidor_TY_E_A_C_W_N_N_

# Retorna para o servidor.sh
# Exibe uma mensagem de confirmação
read -p "Deseja voltar para o MENU PRINCIPAL? (Y/N): " choice

# Verifica a escolha do usuário
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
  sudo chmod +x servidor.sh && ./servidor.sh
  echo "Comando executado."
elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
  echo "Comando não executado. Continuando..."
else
  echo "Escolha inválida. Saindo."
fi
