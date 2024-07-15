#!/bin/bash

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


function prompt_input {
    local prompt_message="$1"
    local var_name="$2"
    while [ -z "${!var_name}" ]; do
        read -p "$prompt_message: " $var_name
        if [ -z "${!var_name}" ]; then
            echo "Resposta inválida. Não pode ser vazio."
        fi
    done
}

#########################################################

clear

echo ""
echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ║  \033[34m     Preencha as informações solicitadas abaixo       \033[31m║\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
echo ""

#########################################################

# Gera uma chave secreta de 32 caracteres (16 bytes em hexadecimal)
    key=$(openssl rand -hex 16)


while true; do
    prompt_input "Digite seu domínio para acessar a EvolutionApi (ex: api.dominio.com)" dominio
    echo ""
    prompt_input "Digite a porta da EvolutionApi (padrão: 8080)" porta
    echo ""
    prompt_input "Digite o Email para ativação do seu SSL (ex: certificado.ssl@gmail.com)" emaill
    echo ""
    prompt_input "Digite o nome da sua Empresa (ex: RPA)" client
    echo ""
    echo "ATENÇÃO ⚠️ CRIE UM TOKEN DE 32 CARACTERES OU USE O QUE JA ESTÁ AQUI ⚠️: https://codebeautify.org/generate-random-hexadecimal-numbers"
    prompt_input "Já foi gerado uma ApiKey Global automaticamente ( Pode copiar: $key)" keyy    
    

    # Pergunte ao usuário se as informações estão corretas

    echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[31m              ║                                                        ║\033[0m"
    echo -e "\033[31m              ║  \033[34m   Verifique se os dados abaixos estão ccorretos      \033[31m║\033[0m"
    echo -e "\033[31m              ║                                                        ║\033[0m"
    echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"

    echo ""    
    echo "As informações fornecidas estão corretas?"
    echo ""
    echo "Domínio da API: $dominio"
    echo "Porta da API: $porta"
    echo "O Email para ativação do SSL: $emaill"
    echo "Nome da EMPRESA: $client"
    echo "ApiKey Global: $keyy"
    echo ""
    read -p "Digite 'Y' para continuar ou 'N' para corrigir: " confirmacao

    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then
        break  # Se as informações estiverem corretas, saia do loop
    elif [ "$confirmacao" = "N" ] || [ "$confirmacao" = "n" ]; then
        echo "Encerrando a instalação, por favor, inicie a instalação novamente."
        exit 0 
    else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1           
    fi
done

#########################################################

clear

cd

cd /home

echo "Clonando git e trocando para develop"

git clone https://github.com/EvolutionAPI/evolution-api.git

cd evolution-api

apt install npm -f

sudo git pull

#git branch -a

#git checkout develo

#########################################################

cd

cd /home/evolution-api/src

clear

echo "Criando Env e Instalando com NPM"

sudo touch env.yml

echo "# Choose the server type for the application
SERVER:
  TYPE: http # https
  PORT: $porta # 443
  URL: https://$dominio
  DISABLE_MANAGER: false
  DISABLE_DOCS: false

CORS:
  ORIGIN:
    - \"*\"
    # - yourdomain.com
  METHODS:
    - POST
    - GET
    - PUT
    - DELETE
  CREDENTIALS: true

# Install ssl certificate and replace string <domain> with domain name
# Access: https://certbot.eff.org/instructions?ws=other&os=ubuntufocal
SSL_CONF:
  PRIVKEY: /etc/letsencrypt/live/<domain>/privkey.pem
  FULLCHAIN: /etc/letsencrypt/live/<domain>/fullchain.pem

# Determine the logs to be displayed
LOG:
  LEVEL:
    - ERROR
    - WARN
    - DEBUG
    - INFO
    - LOG
    # VERBOSE
    - DARK
    - WEBHOOKS
  COLOR: true
  BAILEYS: error # fatal | error | warn | info | debug | trace

# Determine how long the instance should be deleted from memory in case of no connection.
# Default time: 5 minutes
# If you don't even want an expiration, enter the value false
DEL_INSTANCE: false # or false
DEL_TEMP_INSTANCES: true # Delete instances with status closed on start

# Seesion Files Providers
# Provider responsible for managing credentials files and WhatsApp sessions.
PROVIDER:
  ENABLED: false
  HOST: 127.0.0.1
  PORT: 5656
  PREFIX: evolution

# Temporary data storage
STORE:
  MESSAGES: true
  MESSAGE_UP: true
  CONTACTS: true
  CHATS: true

CLEAN_STORE:
  CLEANING_INTERVAL: 7200 # 7200 seconds === 2h
  MESSAGES: true
  MESSAGE_UP: true
  CONTACTS: true
  CHATS: true

# Permanent data storage
DATABASE:
  ENABLED: false
  CONNECTION:
    URI: \"mongodb://root:root@localhost:27017/?authSource=admin&readPreference=primary&ssl=false&directConnection=true\"
    DB_PREFIX_NAME: evolution
  # Choose the data you want to save in the application's database or store
  SAVE_DATA:
    INSTANCE: false
    NEW_MESSAGE: false
    MESSAGE_UPDATE: false
    CONTACTS: false
    CHATS: false

RABBITMQ:
  ENABLED: false
  URI: \"amqp://guest:guest@localhost:5672\"
  EXCHANGE_NAME: evolution_exchange
  GLOBAL_ENABLED: true
  EVENTS:
    APPLICATION_STARTUP: false
    INSTANCE_CREATE: false
    INSTANCE_DELETE: false
    QRCODE_UPDATED: false
    MESSAGES_SET: false
    MESSAGES_UPSERT: true
    MESSAGES_UPDATE: true
    MESSAGES_DELETE: false
    SEND_MESSAGE: false
    CONTACTS_SET: false
    CONTACTS_UPSERT: false
    CONTACTS_UPDATE: false
    PRESENCE_UPDATE: false
    CHATS_SET: false
    CHATS_UPSERT: false
    CHATS_UPDATE: false
    CHATS_DELETE: false
    GROUPS_UPSERT: true
    GROUP_UPDATE: true
    GROUP_PARTICIPANTS_UPDATE: true
    CONNECTION_UPDATE: true
    CALL: false
    # This events is used with Typebot
    TYPEBOT_START: false
    TYPEBOT_CHANGE_STATUS: false

SQS:
  ENABLED: true
  ACCESS_KEY_ID: \"\"
  SECRET_ACCESS_KEY: \"\"
  ACCOUNT_ID: \"\"
  REGION: \"us-east-1\"

WEBSOCKET:
  ENABLED: false
  GLOBAL_EVENTS: false

WA_BUSINESS:
  TOKEN_WEBHOOK: evolution
  URL: https://graph.facebook.com
  VERSION: v18.0
  LANGUAGE: pt_BR

# Global Webhook Settings
# Each instance's Webhook URL and events will be requested at the time it is created
WEBHOOK:
  # Define a global webhook that will listen for enabled events from all instances
  GLOBAL:
    URL: <url>
    ENABLED: false
    # With this option activated, you work with a url per webhook event, respecting the global url and the name of each event
    WEBHOOK_BY_EVENTS: false
  # Automatically maps webhook paths
  # Set the events you want to hear
  EVENTS:
    APPLICATION_STARTUP: false
    QRCODE_UPDATED: true
    MESSAGES_SET: true
    MESSAGES_UPSERT: true
    MESSAGES_UPDATE: true
    MESSAGES_DELETE: true
    SEND_MESSAGE: true
    CONTACTS_SET: true
    CONTACTS_UPSERT: true
    CONTACTS_UPDATE: true
    PRESENCE_UPDATE: true
    CHATS_SET: true
    CHATS_UPSERT: true
    CHATS_UPDATE: true
    CHATS_DELETE: true
    GROUPS_UPSERT: true
    GROUP_UPDATE: true
    GROUP_PARTICIPANTS_UPDATE: true
    CONNECTION_UPDATE: true
    LABELS_EDIT: true
    LABELS_ASSOCIATION: true
    CALL: true
    # This event fires every time a new token is requested via the refresh route
    NEW_JWT_TOKEN: false
    # This events is used with Typebot
    TYPEBOT_START: false
    TYPEBOT_CHANGE_STATUS: false
    # This event is used with Chama AI
    CHAMA_AI_ACTION: false
    # This event is used to send errors to the webhook
    ERRORS: false
    ERRORS_WEBHOOK: <url>

CONFIG_SESSION_PHONE:
  # Name that will be displayed on smartphone connection
  CLIENT: "$client"
  NAME: Chrome # Chrome | Firefox | Edge | Opera | Safari

# Set qrcode display limit
QRCODE:
  LIMIT: 30
  COLOR: \"#198754\"

TYPEBOT:
  API_VERSION: \"old\" # old | latest
  KEEP_OPEN: false

CHATWOOT:
  # If you leave this option as false, when deleting the message for everyone on WhatsApp, it will not be deleted on Chatwoot.
  MESSAGE_DELETE: true # false | true
  # If you leave this option as true, when sending a message in Chatwoot, the client's last message will be marked as read on WhatsApp.
  MESSAGE_READ: false # false | true
  IMPORT:
    # This db connection is used to import messages from whatsapp to chatwoot database
    DATABASE:
      CONNECTION:
        URI: \"postgres://user:password@hostname:port/dbname?sslmode=disable\"
    PLACEHOLDER_MEDIA_MESSAGE: true

# Cache to optimize application performance
CACHE:
  REDIS:
    ENABLED: false
    URI: \"redis://localhost:6379\"
    PREFIX_KEY: \"evolution\"
    TTL: 604800
    SAVE_INSTANCES: false
  LOCAL:
    ENABLED: false
    TTL: 86400

# Defines an authentication type for the api
# We recommend using the apikey because it will allow you to use a custom token,
# if you use jwt, a random token will be generated and may be expired and you will have to generate a new token
AUTHENTICATION:
  TYPE: apikey # jwt or apikey
  # Define a global apikey to access all instances
  API_KEY:
    # OBS: This key must be inserted in the request header to create an instance.
    KEY: $keyy
  # Expose the api key on return from fetch instances
  EXPOSE_IN_FETCH_INSTANCES: true
  # Set the secret key to encrypt and decrypt your token and its expiration time.
  JWT:
    EXPIRIN_IN: 0 # seconds - 3600s === 1h | zero (0) - never expires
    SECRET: L=0YWt]b2w[WF>#>:&E\`

LANGUAGE: \"pt-BR\" # pt-BR, en
" > env.yml

#########################################################

cd

cd /home/evolution-api

sudo npm run start:prod

echo "Iniciando pm2"

sudo npm install -g pm2@latest --force

sudo pm2 start 'npm run start:prod' --name ApiEvolution

sudo pm2 startup && sudo pm2 save --force

#########################################################

cd

cd

# Remove a configuração padrão do Nginx
sudo rm /etc/nginx/conf.d/default.conf

#########################################################

cd

cd /etc/nginx/conf.d/

echo "Arquivo default"

sudo touch default.conf

echo "
server {
  listen 80;
  listen [::]:80;
  server_name _;
  root /var/www/html/;
  index index.php index.html index.htm index.nginx-debian.html;

location / {
    try_files $uri $uri/ /index.php;
  }

location ~ \.php$ {
    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
    include snippets/fastcgi-php.conf;
  }

# Um longo tempo de cache do navegador pode acelerar visitas repetidas à sua página
location ~* \.(jpg|jpeg|gif|png|webp|svg|woff|woff2|ttf|css|js|ico|xml)$ {
       access_log off;
       log_not_found off;
       expires 360d;
  }

# desativar acesso a arquivos ocultos
location ~ /\.ht {
      access_log off;
      log_not_found off;
      deny all;
  }
}
" > default.conf

#########################################################

cd

systemctl reload nginx

chown www-data:www-data /usr/share/nginx/html -R

#########################################################

cd

cd /etc/nginx/sites-available

echo "Proxy Reverso"

cat > api << EOL
server {
  server_name $dominio;

  location / {
    proxy_pass http://127.0.0.1:$porta;
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

#########################################################

cd

ln -s /etc/nginx/sites-available/api /etc/nginx/sites-enabled

chown www-data:www-data /usr/share/nginx/html -R

nginx -t

systemctl reload nginx

#########################################################

sudo apt-get update

sudo apt-get upgrade -y

echo "proxy reverso da Evolution e do typebot"

sudo snap install --classic certbot

sudo certbot --nginx --email $emaill --redirect --agree-tos -d $dominio 

#########################################################

cd

cd

clear

echo ""
echo ""
echo "Clique ou copie o link para abrir a sua Evolution-API https://$dominio"
echo "Sua ApiKey Global: $keyy"
echo ""
echo ""

#########################################################

cd

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
