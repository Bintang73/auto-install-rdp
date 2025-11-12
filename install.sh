#!/bin/bash

# Warna dengan tput
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
MAGENTA=$(tput setaf 5)
YELLOW=$(tput setaf 3)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# Mendapatkan IP VPS
get_ip() {
    curl -s ifconfig.me
}

# Instalasi RDP
install_rdp() {
    echo "${BOLD}${CYAN}\n💻 Instalasi RDP Dimulai...\n${RESET}"
    apt update -y && apt install bzip2 shc -y
    wget -q https://github.com/Bintang73/auto-install-rdp/raw/refs/heads/main/main -O setup
    chmod +x setup
    ./setup
}

# Menu Utama
main_menu() {
    clear

    # ASCII Art
    echo "${CYAN}";
    echo "██████╗ ██████╗ ██████╗       ██╗   ██╗██████╗ ███████╗";
    echo "██╔══██╗██╔══██╗██╔══██╗      ██║   ██║██╔══██╗██╔════╝";
    echo "██████╔╝██║  ██║██████╔╝█████╗██║   ██║██████╔╝███████╗";
    echo "██╔══██╗██║  ██║██╔═══╝ ╚════╝╚██╗ ██╔╝██╔═══╝ ╚════██║";
    echo "██║  ██║██████╔╝██║            ╚████╔╝ ██║     ███████║";
    echo "╚═╝  ╚═╝╚═════╝ ╚═╝             ╚═══╝  ╚═╝     ╚══════╝";
    echo "${RESET}";

    # Info VPS
    echo "${GREEN}Version    : ${WHITE}1.0 (Free Version)${RESET}"
    echo "${GREEN}IP VPS     : ${WHITE}$(get_ip)${RESET}"
    echo "${GREEN}Powered By : ${WHITE}@starfz - PurwokertoDev${RESET}"

    echo "${MAGENTA}\n📋 Pilih Opsi:${RESET}"
    echo "${CYAN}1.${RESET} ${WHITE}Auto Install RDP${RESET}"
    echo "${CYAN}2.${RESET} ${WHITE}Check Detail VPS${RESET}"
    echo "${CYAN}8.${RESET} ${RED}Exit${RESET}"

    echo ""

    echo "${YELLOW}====================================================${RESET}"

    echo ""

    # Input user
    printf "${BOLD}${CYAN}Masukkan pilihan Anda (1-2, 8): ${RESET}"
    read pilihan

    case "$pilihan" in
        1) install_rdp ;;
        2)
            echo "${YELLOW}\n📌 Detail VPS${RESET}"
            echo "IP VPS : ${WHITE}$(get_ip)${RESET}\n"
            read -p "Tekan Enter untuk kembali ke menu..." dummy
            main_menu
            ;;
        8)
            echo "${BOLD}${CYAN}\n👋 Keluar... Terima kasih!\n${RESET}"
            exit 0
            ;;
        *)
            echo "${RED}Pilihan tidak valid. Silakan pilih antara 1, 2, atau 8.${RESET}"
            sleep 1
            main_menu
            ;;
    esac
}

# Jalankan menu
main_menu
