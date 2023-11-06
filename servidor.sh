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

# Exibe o banner informativo

display_banner() {
  echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
  echo -e "\033[31m              ║                                                        ║\033[0m"
  echo -e "\033[31m              ║  \033[34m            O destino está nas suas mãos              \033[31m║\033[0m"
  echo -e "\033[31m              ║                                                        ║\033[0m"
  echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
}

# Função para exibir o menu
display_menu() { 
  echo ""
  echo -e "\e[34mEscolha uma opção para instalação:\e[0m"
  echo ""
  echo -e "  0. \e[31mInstalar Programas Recomendados\e[0m"  
  echo -e "  1. \e[31mInstalar Typeboot\e[0m"  
  echo -e "  2. \e[31mInstalar Evolution API com Proxy Reverso\e[0m"
  echo -e "  3. \e[31mInstalar Appsmith\e[0m" 
  echo -e "  4. \e[31mInstalar Chatwoot 3.1.1 Edition\e[0m"
  echo -e "  5. \e[31mInstalar Whaticket\e[0m"
  echo -e "  6. \e[31mInstalar N8N\e[0m"
  echo -e "  7. \e[31mInstalar Nginx Manager\e[0m"
  echo -e "  8. \e[31mSair\e[0m"
  echo ""
}

#########################################################

# Exibe o banner informativo
display_banner

# Exibe o menu
display_menu

#########################################################

# Ler a opção escolhida pelo usuário
read -p "Digite o número da opção desejada e pressione Enter: " option

# Executa a ação correspondente à opção escolhida
case $option in
  0)
    # Adicione aqui os comandos para instalar o 0instaladores.sh
    chmod +x 0instaladores.sh
    ./0instaladores.sh
    ;;
  1)
    # Adicione aqui os comandos para instalar o 1typebot.sh
    chmod +x 1typebot.sh
    ./1typebot.sh
    ;;
  2)
    # Adicione aqui os comandos para instalar o 2evolution-api-proxy.sh
    chmod +x 2evolution-api-proxy.sh
    ./2evolution-api-proxy.sh
    ;;
  3)
    # Adicione aqui os comandos para instalar o 3appsmith.sh
    chmod +x 3appsmith.sh
    ./3appsmith.sh
    ;;
  4)
    # Adicione aqui os comandos para instalar o 4chatwoot_3_1_1.sh
    chmod +x 4chatwoot_3_1_1.sh
    ./4chatwoot_3_1_1.sh
    ;;
  5)
    # Adicione aqui os comandos para instalar o 5whaticket.sh    
    chmod +x 5whaticket.sh
    ./5whaticket.sh
    ;;
  6)
    # Adicione aqui os comandos para instalar o 6n8n.sh.sh
    chmod +x 6n8n.sh.sh
    ./6n8n.sh
    ;;
  7)
    # Adicione aqui os comandos para instalar o 7ngx-manager.sh
    chmod +x 7ngx-manager.sh
    ./7ngx-manager.sh
    ;;
  8)
    # Sair
    echo "Saindo do instalador."
    exit 0
    ;; 
  *)
    echo "Opção inválida. Por favor, escolha uma opção válida."
    ;;
esac

# Fim do script
exit 0
