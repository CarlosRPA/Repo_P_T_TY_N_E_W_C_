#!/bin/bash

# Atualiza e atualiza o sistema
sudo apt update

sudo apt upgrade -y

###############################################################

cd

cd

# Baixa o instalador do Whaticket
sudo apt install -y git && git clone https://github.com/CarlosRPA/install_WT_RPA.git

# Dá permissões de execução ao script de instalação
sudo chmod -R 777 install_WT_RPA

# Entrar no diretorio
cd install_WT_RPA

# Executa o script de instalação do Chatwoot
sudo ./install_primaria

###############################################################

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
