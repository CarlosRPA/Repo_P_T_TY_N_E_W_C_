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
echo -e "\e[32m=                 \e[33mPreencha as informações solicitadas abaixo\e[32m                 =\e[0m"
echo -e "\e[32m=                                                                            =\e[0m"
echo -e "\e[32m==============================================================================\e[0m"
echo ""

    # Função para configurar o TypeBot
    echo "Agora vamos configurar o Typebot para rodar em Docker"
echo ""
while true; do

    read -p "Qual é a versão do Typebot que você deseja instalar (ex: ultima atualização 'latest'): " versionn

    while [ -z "$versionn" ]; do
        echo "Resposta inválida. A versão do Typebot não pode ser vazio."
        read -p "Qual é a versão do Typebot que você deseja instalar (ex: ultima atualização 'latest'): " versionn
    done

    read -p "Qual é o seu domínio para o Typebot (ex: typebot.seudominio.com): " builder

    while [ -z "$builder" ]; do
        echo "Resposta inválida. O domínio do Typebot não pode ser vazio."
        read -p "Qual é o seu domínio para o Typebot (ex: typebot.seudominio.com): " builder
    done

    echo ""
    read -p "Porta para o Typebot (padrão: 3301): " portabuilder

    while [ -z "$portabuilder" ]; do
        portabuilder="3301"
    done

    read -p "Qual é o seu domínio para o Bot (ex: bot.seudominio.com): " viewer

    while [ -z "$viewer" ]; do
        echo "Resposta inválida. O domínio do Bot não pode ser vazio."
        read -p "Qual é o seu domínio para o Bot (ex: bot.seudominio.com): " viewer
    done

    echo ""
    read -p "Porta para seu Bot (padrão: 3302): " portaviewer

    while [ -z "$portaviewer" ]; do
        portaviewer="3302"
    done

    read -p "Qual é o seu domínio para o Storage (ex: storage.seudominio.com): " storage

    while [ -z "$storage" ]; do
        echo "Resposta inválida. O domínio do Storage não pode ser vazio."
        read -p "Qual é o seu domínio para o Storage (ex: storage.seudominio.com): " storage
    done

    echo ""
    read -p "Porta para o Storage (padrão: 9020): " portastorage

    while [ -z "$portastorage" ]; do
        portastorage="9020"
    done

    read -p "Seu Email (Esse script está configurado para funcionar com o Gmail, então, em outro email, pode não funcionar): " email

    while [ -z "$email" ]; do
        echo "Resposta inválida. O Email não pode ser vazio."
        read -p "Seu Email (Esse script está configurado para funcionar com o Gmail, então, em outro email, pode não funcionar): " email
    done

    echo ""
    read -p "Senha do aplicativo do Gmail (Se você não souber o que é, pare aqui e procure): " senha

    while [ -z "$senha" ]; do
        echo "Resposta inválida. A senha não pode ser vazia."
        read -p "Senha do aplicativo do Gmail (Se você não souber o que é, pare aqui e procure): " senha
    done

    echo ""
    read -p "SMTP do Gmail (ex: smtp.gmail.com): " smtp

    while [ -z "$smtp" ]; do
        echo "Resposta inválida. O SMTP do Gmail não pode ser vazio."
        read -p "SMTP do Gmail (Ex: smtp.gmail.com): " smtp
    done

    echo ""
    read -p "Porta SMTP (Ex: 587): " portasmtp

    while [ -z "$portasmtp" ]; do
        echo "Resposta inválida. A porta SMTP não pode ser vazia."
        read -p "Porta SMTP (Ex: 587): " portasmtp
    done

    # Gera uma chave secreta de 32 caracteres (16 bytes em hexadecimal)
    key=$(openssl rand -hex 16)  

    clear  

    echo -e "\e[32m==============================================================================\e[0m"
    echo -e "\e[32m=                                                                            =\e[0m"
    echo -e "\e[32m=                 \e[33mVerifique com muita atenção\e[32m                 =\e[0m"
    echo -e "\e[32m=                                                                            =\e[0m"
    echo -e "\e[32m==============================================================================\e[0m"

    echo ""
    echo -e "\e[31mAs informações fornecidas estão corretas?\e[0m"
    echo ""
    echo -e "\e[34mVersão do Typebot: $versionn\e[0m"
    echo -e "\e[34mDomínio do Typebot: $builder\e[0m"
    echo -e "\e[34mPorta do Typebot: $portabuilder\e[0m"
    echo -e "\e[34mDomínio do Bot: $viewer\e[0m"
    echo -e "\e[34mPorta do Bot: $portaviewer\e[0m"
    echo -e "\e[34mDomínio do Storage: $storage\e[0m"
    echo -e "\e[34mPorta do Storage: $portastorage\e[0m"
    echo -e "\e[34mEmail: $email\e[0m"
    echo -e "\e[34mSMTP do Gmail: $smtp\e[0m"
    echo -e "\e[34mPorta SMTP: $portasmtp\e[0m"
    echo -e "\e[34mChave secreta (ApiKey): $key\e[0m"
    echo ""
    read -p "Digite 'Y' para continuar ou 'N' para corrigir: " confirmacao

    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then
        break
    elif [ "$confirmacao" = "N" ] || [ "$confirmacao" = "n" ]; then
        echo "Encerrando a instalação, por favor, inicie a instalação novamente."
        exit 0 
    else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1           
    fi
done

#######################################################

# Criar a pasta 'typeboot' no diretório raiz

cd 

echo "Criando a pasta 'typeboot'...."

mkdir ~/typeboot

# Navegar até a pasta 'typeboot'
cd ~/typeboot

echo "Instalando Typebot"

echo "Criando arquivo docker-compose.yml"

cat > docker-compose.yml << EOL
version: '3.3'
services:
  typebot-db:
    image: postgres:13
    restart: always
    volumes:
      - db_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=typebot # Troque se necessario
      - POSTGRES_PASSWORD=typebot # Troque se necessario
  typebot-builder:
    labels:
      virtual.host: '$builder' # Troque pelo seu dominio ou subdominio
      virtual.port: '3000'
      virtual.tls-email: '$email' # Troque pelo seu email
    image: baptistearno/typebot-builder:$versionn
    restart: always
    ports:
      - '$portabuilder:3000'
    depends_on:
      - typebot-db
    extra_hosts:
      - 'host.docker.internal:host-gateway'
    # See https://docs.typebot.io/self-hosting/configuration for more configuration options
    environment:
      - DATABASE_URL=postgresql://postgres:typebot@typebot-db:5432/typebot
      - NEXTAUTH_URL=https://$builder # Troque pelo seu dominio ou subdominio
      - NEXT_PUBLIC_VIEWER_URL=https://$viewer # Troque pelo seu dominio ou subdominio
      - ENCRYPTION_SECRET=$key
      - ADMIN_EMAIL=$email # Troque pelo seu email
      #- DISABLE_SIGNUP=false # Mude Para false caso queira permitir que outras pessoas criem contas
      - SMTP_AUTH_DISABLED=false
      - false=true # Troque para false seu nao usar a porta $portasmtp ou se estiver enfretando problemas no login
      - SMTP_HOST=$smtp # Troque pelo seu SMTP USE SOMENTE DOMINIO PROPRIETARIOS
      - SMTP_PORT=$portasmtp # altere aqui se nescessario portas comuns 25, 587, $portasmtp, 2525
      - SMTP_USERNAME=$email # troque pelo seu email
      - SMTP_PASSWORD=$senha # Troque pela sua senha
      - NEXT_PUBLIC_SMTP_FROM=$email # Troque pelo seu email
      - S3_ACCESS_KEY=minio # Troque se necessario
      - S3_SECRET_KEY=minio123 # Troque se necessario
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$storage # Troque pelo seu dominio ou subdominio
  typebot-viewer:
    labels:
      virtual.host: '$viewer' # Troque pelo seu dominio ou subdominio
      virtual.port: '3000'
      virtual.tls-email: '$email' # Troque pelo seu email
    image: baptistearno/typebot-viewer:$versionn
    restart: always
    ports:
      - '$portaviewer:3000'
    # See https://docs.typebot.io/self-hosting/configuration for more configuration options
    environment:
      - DATABASE_URL=postgresql://postgres:typebot@typebot-db:5432/typebot
      - NEXTAUTH_URL=https://$builder # Troque pelo seu dominio ou subdominio
      - NEXT_PUBLIC_VIEWER_URL=https://$viewer # Troque pelo seu dominio ou subdominio
      - ENCRYPTION_SECRET=$key
      - SMTP_HOST=$smtp # Troque pelo seu SMTP USE SOMENTE DOMINIO PROPRIETARIOS
      - NEXT_PUBLIC_SMTP_FROM=$email # Troque pelo seu email
      - S3_ACCESS_KEY=minio # Troque se necessario - Deve ser Igual ao Declarado no Typebot Builder S3_ACCESS_KEY=
      - S3_SECRET_KEY=minio123 # Troque se necessario - Deve ser Igual ao Declarado no Typebot Builder S3_SECRET_KEY=
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$storage # Troque pelo seu dominio ou subdominio
  mail:
    image: bytemark/smtp
    restart: always
  minio:
    labels:
      virtual.host: '$storage' # Troque pelo seu dominio ou subdominio
      virtual.port: '9000' #$portastorage
      virtual.tls-email: '$email' # Troque pelo seu email
    image: minio/minio
    command: server /data
    ports:
      - '9000:9000'
    environment:
      MINIO_ROOT_USER: minio # Troque se necessario - Deve ser Igual ao Declarado no Typebot Builder S3_ACCESS_KEY=
      MINIO_ROOT_PASSWORD: minio123 # Troque se necessario - Deve ser Igual ao Declarado no Typebot Builder S3_SECRET_KEY=
    volumes:
      - s3_data:/data
  # This service just make sure a bucket with the right policies is created

  # Certifique-se de atualizar S3_ACCESS_KEY , S3_SECRET_KEY abaixo para corresponder às suas configurações do S3, elas estão no final dessa linha /usr/bin/mc config host add minio http://minio:9000 minio minio123; sendo o usuario e a senha em sequencia.
  createbuckets:
    image: minio/mc
    depends_on:
      - minio
    entrypoint: >
      /bin/sh -c "
      sleep 10;
      /usr/bin/mc config host add minio http://minio:9000 minio minio123;
      /usr/bin/mc mb minio/typebot;
      /usr/bin/mc anonymous set public minio/typebot/public;
      exit 0;
      "
volumes:
  db_data:
  s3_data:

EOL

echo "Criado e configurado com sucesso"

###############################################

clear

echo "Iniciando Conteiner"

sudo docker-compose up -d

echo "Typebot Instaldo... Realizando Proxy Reverso"

###############################################

cd

cd

clear

cat > typebot << EOL
server {

  server_name $builder;

  location / {

    proxy_pass http://127.0.0.1:$portabuilder;

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

###############################################

sudo mv typebot /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/typebot /etc/nginx/sites-enabled

###############################################

cd

cat > bot << EOL
server {

  server_name $viewer;

  location / {

    proxy_pass http://127.0.0.1:$portaviewer;

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

###############################################

sudo mv bot /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/bot /etc/nginx/sites-enabled

##################################################

cd

cat > storage << EOL
server {

  server_name $storage;

  location / {

    proxy_pass http://127.0.0.1:$portastorage;

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

###############################################

sudo mv storage /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/storage /etc/nginx/sites-enabled

#########################################################

sudo systemctl start nginx

sudo systemctl reload nginx

sudo systemctl enable nginx

echo "proxy reverso da Evolution e do typebot"

sudo certbot --nginx --email $email --redirect --agree-tos  -d $builder -d $viewer -d $storage


#######################################################

cd

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
