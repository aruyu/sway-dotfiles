#!/bin/bash
#==
#   NOTE      - install_zsh.sh
#   Author    - Aru
#
#   Created   - 2022.10.19
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



T_CO_RED='\e[1;31m'
T_CO_YELLOW='\e[1;33m'
T_CO_GREEN='\e[1;32m'
T_CO_BLUE='\e[1;34m'
T_CO_GRAY='\e[1;30m'
T_CO_NC='\e[0m'

CURRENT_PROGRESS=0

function script_print()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$1"
}

function script_print_notify()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$T_CO_GREEN-Notify- $1$T_CO_NC"
}

function script_print_error()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$T_CO_RED-Error- $1$T_CO_NC"
}

function error_exit()
{
  script_print_error "$1\n\n"
  exit 1
}




#==
#   Starting Code in below.
#/

if [[ $EUID -eq 0 ]]; then
  error_exit "This script must be run as USER!"
fi

ARCH=Arch
UBUNTU=Ubuntu
MAC=Mac
FONT=Font

while true; do
  read -p "Enter what you want to install (Arch, Ubuntu, Mac, Font): " SELECTION
  case $SELECTION in
    [Aa][Rr][Cc][Hh] )          CURRENT_JOB=Arch; break;;
    [Uu][Bb][Uu][Nn][Tt][Uu] )  CURRENT_JOB=Ubuntu; break;;
    [Mm][Aa][Cc] )              CURRENT_JOB=Mac; break;;
    [Ff][Oo][Nn][Tt] )          CURRENT_JOB=Font; break;;
    * )                         echo "Wrong answer.";;
  esac
done


if [ $CURRENT_JOB = $ARCH ]; then
  script_print_notify "Selected OS: $CURRENT_JOB"

  sudo pacman -S --needed --noconfirm zsh
  chsh -s /bin/zsh
  env | grep ^SHELL=

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<-EOF
	y
EOF

  zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  curl -o $HOME/.config/zsh/.zshrc https://raw.githubusercontent.com/aruyu/hyprland-dotfiles/master/.zshrc

elif [ $CURRENT_JOB = $UBUNTU ]; then
  script_print_notify "Selected OS: $CURRENT_JOB"

  sudo apt-get -y install zsh
  chsh -s /bin/zsh
  env | grep ^SHELL=

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<-EOF
	y
EOF

  zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  curl -o $HOME/.config/zsh/.zshrc https://raw.githubusercontent.com/aruyu/hyprland-dotfiles/master/.zshrc

elif [ $CURRENT_JOB = $MAC ]; then
  script_print_notify "Selected OS: $CURRENT_JOB"

  chsh -s /bin/zsh
  env | grep ^SHELL=

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<-EOF
	y
EOF

  zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  curl -o $HOME/.config/zsh/.zshrc https://raw.githubusercontent.com/aruyu/hyprland-dotfiles/master/.zshrc

elif [ $CURRENT_JOB = $FONT ]; then
  echo -ne "Selected Job: $CURRENT_JOB\n"

  mkdir -p $HOME/.local/share/fonts/
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip || error_exit "Installation Faild... wget needed."
  unzip JetBrainsMono.zip -d $HOME/.local/share/fonts/ || error_exit "Installation Faild... unzip needed."
  rm JetBrainsMono.zip

  script_print_notify "Make sure you set fonts for your terminal properly.\n"
fi


script_print_notify "$CURRENT_JOB installation successfully done.\n"
