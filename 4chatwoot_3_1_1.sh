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
echo -e "\e[93m==============================================================================\e[0m"
echo -e "\e[93m=                                                                            =\e[0m"
echo -e "\e[93m=                 \e[33mPreencha as informações solicitadas abaixo\e[93m                 =\e[0m"
echo -e "\e[93m=                                                                            =\e[0m"
echo -e "\e[93m==============================================================================\e[0m"
echo ""
echo ""
echo ""
echo -e "\e[93mPasso \e[33m1/7\e[0m"
read -p "Digite o dominio para acessar o Chatwoot (ex: app.dominio.com): " dominiochat
echo ""
echo -e "\e[93mPasso \e[33m2/7\e[0m"
read -p "Digite o nome da sua empresa (ex: RPA): " empresachatwoot
echo ""
echo -e "\e[93mPasso \e[33m3/7\e[0m"
read -p "Digite seu email de admin (ex: contato@dominio.com): " emailchat
echo ""
echo -e "\e[93mPasso \e[33m4/7\e[0m"
read -p "Digite o Dominio do seu SMTP (ex: rpa.art.br | ex: gmail.com): " dominiosmtpchatwoot
echo ""
echo -e "\e[93mPasso \e[33m5/7\e[0m"
read -p "Digite o Host SMTP (ex: smtp.hostinger.com): " smtpchatwoot
echo ""
echo -e "\e[93mPasso \e[33m6/7\e[0m"
read -p "Digite a Porta SMTP (ex: 465): " portachatwoot
echo ""
echo -e "\e[93mPasso \e[33m7/7\e[0m"
read -p "Senha do seu Email (se for Gmail precisa ser senha de aplicativo): " senhaemailchatwoot
echo ""
echo -e "\e[93mPasso \e[33m7/7\e[0m"
read -p "Digite a versão do Node.json (ex: ultima atualização latest): " versionn
echo ""



###############################################################

clear
echo ""
echo -e "\e[93m==============================================================================\e[0m"
echo -e "\e[93m=                                                                            =\e[0m"
echo -e "\e[93m=                 \e[33mVerifique se os dados abaixos se estão certos\e[93m                 =\e[0m"
echo -e "\e[93m=                                                                            =\e[0m"
echo -e "\e[93m==============================================================================\e[0m"
echo ""
echo ""
echo -e "Link do chatwoot: \e[33m$dominiochat\e[0m"
echo -e "Nome da empresa: \e[33m$empresachatwoot\e[0m"
echo -e "Email admin: \e[33m$emailchat\e[0m"
echo -e "Dominio SMTP: \e[33m$dominiosmtpchatwoot\e[0m"
echo -e "Host SMTP: \e[33m$smtpchatwoot\e[0m"
echo -e "Porta SMTP: \e[33m$portachatwoot\e[0m"
echo -e "Senha do Email: \e[33m$senhaemailchatwoot\e[0m"
echo ""
echo ""
read -p "As informações estão certas? (y/n): " confirma1
if [ "$confirma1" == "y" ]; then

###############################################################

# INSTALANDO DEPENDENCIAS

cd

sudo apt update

apt upgrade -y

#
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$versionn.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt-get update
sudo apt-get install nodejs -y

sudo timedatectl set-timezone America/Sao_Paulo

###############################################################

# BAIXANDO CHATWOOT E EXECUTANDO

wget https://get.chatwoot.app/linux/install.sh

chmod +x install.sh

clear

echo -e "yes\n$dominiochat\n$emailchat\nyes\nyes" | ./install.sh --install

###############################################################

# EDITANDO .ENV + GUARDANDO POSTGRES

cd

cd chatwoot/chatwoot

postgres_password=$(grep -oP '(?<=POSTGRES_PASSWORD=).+' /home/chatwoot/chatwoot/.env)

##ANTIGO
#sed -i "s/# DEFAULT_LOCALE=en/DEFAULT_LOCALE=pt_BR/g" /home/chatwoot/chatwoot/.env
#sed -i "s/ENABLE_ACCOUNT_SIGNUP=false/ENABLE_ACCOUNT_SIGNUP=true/g" /home/chatwoot/chatwoot/.env
#sed -i "s/^MAILER_SENDER_EMAIL=.*/MAILER_SENDER_EMAIL='$empresachatwoot <$emailchat>'/" /home/chatwoot/chatwoot/.env
#sed -i "s/^FRONTEND_URL=.*/FRONTEND_URL=https://$dominiochat/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTP_DOMAIN=.*/SMTP_DOMAIN=$dominiosmtpchatwoot/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTP_ADDRESS=.*/SMTP_ADDRESS=$smtpchatwoot/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTP_PORT=.*/SMTP_PORT=$portachatwoot/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTP_USERNAME=.*/SMTP_USERNAME=$emailchat/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTPOR_PASSWD=.*/SMTP_PASSWORD=$senhaemailchatwoot/" /home/chatwoot/chatwoot/.env
#sed -i "s/^SMTP_AUTHENTICATION=.*/SMTP_AUTHENTICATION=login/" /home/chatwoot/chatwoot/.env
#sed -i "s/^FORCE_SSL=.*/FORCE_SSL=true/" /home/chatwoot/chatwoot/.env
##

##NOVO
#sed -i "s/# DEFAULT_LOCALE=en/DEFAULT_LOCALE=pt_BR/g" /home/chatwoot/chatwoot/.env
#sed -i "s#ENABLE_ACCOUNT_SIGNUP=false#ENABLE_ACCOUNT_SIGNUP=true#g" /home/chatwoot/chatwoot/.env
#sed -i "s#^MAILER_SENDER_EMAIL=.*#MAILER_SENDER_EMAIL='$empresachatwoot <$emailchat>'#" /home/chatwoot/chatwoot/.env
#sed -i "s#^FRONTEND_URL=.*#FRONTEND_URL=https://$dominiochat/#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_DOMAIN=.*#SMTP_DOMAIN=$dominiosmtpchatwoot#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_ADDRESS=.*#SMTP_ADDRESS=$smtpchatwoot#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_PORT=.*#SMTP_PORT=$portachatwoot#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_USERNAME=.*#SMTP_USERNAME=$emailchat#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_PASSWORD=.*#SMTP_PASSWORD=$senhaemailchatwoot#" /home/chatwoot/chatwoot/.env
#sed -i "s#^SMTP_AUTHENTICATION=.*#SMTP_AUTHENTICATION=login#" /home/chatwoot/chatwoot/.env
#sed -i "s#^FORCE_SSL=.*#FORCE_SSL=true#" /home/chatwoot/chatwoot/.env
#sed -i 's/^# SMTP_TLS=/SMTP_TLS=true/' /home/chatwoot/chatwoot/.env
##

##NOVO 2
sed -i "s/# DEFAULT_LOCALE=en/DEFAULT_LOCALE=pt_BR/g" /home/chatwoot/chatwoot/.env
sed -i "s/ENABLE_ACCOUNT_SIGNUP=false/ENABLE_ACCOUNT_SIGNUP=true/g" /home/chatwoot/chatwoot/.env
sed -i "s/^MAILER_SENDER_EMAIL=.*/MAILER_SENDER_EMAIL='$empresachatwoot <$emailchat>'/" /home/chatwoot/chatwoot/.env
#sed -i 's/^FRONTEND_URL=.*/FRONTEND_URL=https:\/\/$dominiochat/' /home/chatwoot/chatwoot/.env
sed -i "s^FRONTEND_URL=.*^FRONTEND_URL=https://$dominiochat^" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_DOMAIN=.*/SMTP_DOMAIN=$dominiosmtpchatwoot/" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_ADDRESS=.*/SMTP_ADDRESS=$smtpchatwoot/" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_PORT=.*/SMTP_PORT=$portachatwoot/" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_USERNAME=.*/SMTP_USERNAME=$emailchat/" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_PASSWORD=.*/SMTP_PASSWORD=$senhaemailchatwoot/" /home/chatwoot/chatwoot/.env
sed -i "s/^SMTP_AUTHENTICATION=.*/SMTP_AUTHENTICATION=login/" /home/chatwoot/chatwoot/.env
sed -i "s/^FORCE_SSL=.*/FORCE_SSL=true/" /home/chatwoot/chatwoot/.env
sed -i "s/^# SMTP_TLS=/SMTP_TLS=true/" /home/chatwoot/chatwoot/.env

##DICA DO NESTOR DAVALOS
sed -i 's/locale: '\''en'\''/locale: '\''pt_BR'\''/' /home/chatwoot/chatwoot/app/javascript/packs/v3app.js
##


systemctl daemon-reload && systemctl restart chatwoot.target

###############################################################

# HABILITANDO CONFIGURAÇÕES OCULTAS DO CHATWOOT

#sudo -u postgres psql -d chatwoot_production <<EOF
#update installation_configs set locked = false;
#\q
#EOF

sudo -u postgres psql -d chatwoot_production -c "UPDATE installation_configs SET locked = false;"

###############################################################

cd

cd

clear

cd ~/instalador_T_N_E

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
