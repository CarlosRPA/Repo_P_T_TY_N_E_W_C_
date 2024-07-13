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
echo -e "\033[31m              ║  \033[34m     Preencha as informações solicitadas abaixo       \033[31m║\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
echo ""
echo ""
echo ""
echo -e "\e[93mPasso \e[33m1/4\e[0m"
read -p "Digite a versão que deseja instalar do N8N (ex: latest | ex: 1.15.1): " versionnn
echo ""
echo -e "\e[93mPasso \e[33m2/4\e[0m"
read -p "Digite o dominio para acessar o N8N (ex: n8n.dominio.com): " dominionn
echo ""
echo -e "\e[93mPasso \e[33m3/4\e[0m"
read -p "Digite a porta para o N8N (padrão: 5678): " portann
echo ""
echo -e "\e[93mPasso \e[33m4/4\e[0m"
read -p "Digite seu email para o proxy reverso (ex: contato@dominio.com): " emailnn
echo ""

#########################################################

# VERIFICAÇÃO DE DADOS

clear

echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ║  \033[34m   Verifique se os dados abaixos estão ccorretos      \033[31m║\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"

echo ""
echo -e "Link do N8N: \e[33m$dominionn\e[0m"
echo -e "Porta: \e[33m$portann\e[0m"
echo -e "Email: \e[33m$emailnn\e[0m"
echo ""
echo ""
read -p "As informações estão certas? (y/n): " confirma2
if [ "$confirma2" == "y" ]; then

#########################################################

# EXECUTANDO O N8N

cd

cd

clear

sudo npm install -g npm@latest --force

sudo npm install -g n8n@$versionnn --force

sudo npm install -g pm2@latest --force

sudo apt-get update

sudo apt-get upgrade -y

#########################################################

# FAZENDO PROXY REVERSO

cat > n8n << EOL
server {
  server_name $dominionn;
  
  underscores_in_headers on;

  location / {

   proxy_pass http://127.0.0.1:$portann;
   proxy_pass_header Authorization;
   proxy_set_header Upgrade \$http_upgrade;
   proxy_set_header Connection "upgrade";
   proxy_set_header Host \$host;
   proxy_set_header X-Forwarded-Proto \$scheme;
   proxy_set_header X-Forwarded-Ssl on; # Optional
   proxy_set_header X-Real-IP \$remote_addr;
   proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
   proxy_http_version 1.1;
   proxy_set_header Connection "";
   proxy_buffering off;
   client_max_body_size 0;
   proxy_read_timeout 36000s;
   proxy_redirect off;
  }
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  ssl_protocols TLSv1.2 TLSv1.3;
}
EOL

sudo mv n8n /etc/nginx/sites-available/n8n

sudo ln -s /etc/nginx/sites-available/n8n /etc/nginx/sites-enabled

sudo certbot --nginx --email $emailnn --redirect --agree-tos -d $dominionn

sudo systemctl reload nginx

#########################################################

elif [ "$confirma2" == "n" ]; then
    echo "Encerrando a instalação, por favor, inicie a instalação novamente."
    exit 0
else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1
fi

#######################################################

# INICIANDO PM2

pm2 start n8n --cron-restart="01 0 * * *" -- start

sudo pm2 startup ubuntu -u root && sudo pm2 startup ubuntu -u root --hp /root && sudo pm2 save

#######################################################

cd

clear

cd /home/ubuntu/install_P_T_TY_N_E_W_C_/Servidor_TY_E_A_C_W_N_N_

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
