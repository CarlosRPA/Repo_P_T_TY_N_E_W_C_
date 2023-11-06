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

loading() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rCarregando Auto Instalador... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

width=100

loading1() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rIniciando Instalação... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

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
echo -e "\e[93mPasso \e[33m1/3\e[0m"
read -p "Digite seu dominio para acessar o appsmith (ex: painel.dominio.com): " linkappsmith
echo ""
echo -e "\e[93mPasso \e[33m2/3\e[0m"
read -p "Digite a porta para o appsmith (padrão: 8181): " portaappsmith
echo ""
echo -e "\e[93mPasso \e[33m3/3\e[0m"
read -p "Digite um email para o proxy reverso (ex: contato@dominio.com): " emailappsmith
echo ""

#########################################################

clear

echo ""
echo -e "Dominio do Appsmith: \e[33m$linkappsmith\e[0m"
echo -e "Porta do Appsmith: \e[33m$portaappsmith\e[0m"
echo -e "Seu Email: \e[33m$emailappsmith\e[0m"
echo ""
echo ""
read -p "As informações estão certas? (y/n): " confirma2
if [ "$confirma2" == "y" ]; then

#########################################################

clear

cd

mkdir appsmith

cd appsmith

curl -L https://bit.ly/docker-compose-CE -o $PWD/docker-compose.yml

sudo sed -i "s/80:80/$portaappsmith:80/g" docker-compose.yml

sudo sed -i 's/443:443/8443:443/g' docker-compose.yml

sudo docker-compose up -d

#########################################################

cd

cat > appsmith_nginx << EOL
server {

  server_name $linkappsmith;

  location / {

    proxy_pass http://127.0.0.1:$portaappsmith;

    proxy_http_version 1.1;

    proxy_set_header Upgrade \$http_upgrade;

    proxy_set_header Connection 'upgrade';

    proxy_set_header Host \$host;

    proxy_set_header X-Real-IP \$remote_addr;

    proxy_set_header X-Forwarded-Proto \$scheme;

    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    
    proxy_cache_bypass \$http_upgrade;

      }

  }
EOL

sudo mv appsmith_nginx /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/appsmith_nginx /etc/nginx/sites-enabled

sudo systemctl reload nginx

sudo certbot --nginx --email $emailappsmith --redirect --agree-tos -d $linkappsmith

#########################################################

elif [ "$confirma2" == "n" ]; then
    echo "Encerrando a instalação, por favor, inicie a instalação novamente."
    exit 0
else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1
fi

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
