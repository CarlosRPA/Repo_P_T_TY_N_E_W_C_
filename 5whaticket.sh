#!/bin/bash

# Atualiza e atualiza o sistema
sudo apt update

sudo apt upgrade -y

###############################################################

cd

cd

# Baixa o instalador do Whaticket
sudo apt install -y git && git clone https://github.com/Rickinet/chat_zap.git

# Dá permissões de execução ao script de instalação
sudo chmod -R 777 chat_zap

# Entrar no diretorio
cd chat_zap

# Executa o script de instalação do Chatwoot
sudo ./install_primaria

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
