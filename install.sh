#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    echo '[!] Execute with normal user'
    exit 1
fi
cwd=$(pwd)
current_user=$(whoami)
sudo apt update
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions bat -y
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -s -f /home/$current_user/.local/kitty.app/bin/kitty /bin/kitty
sudo cp Hack.zip /usr/share/fonts
cd /usr/share/fonts
sudo unzip /usr/share/fonts/Hack.zip
sudo rm /usr/share/fonts/Hack.zip
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $current_user
rm ~/.zshrc &>/dev/null
cd "$cwd"
cp .zshrc ~/.zshrc
sudo ln -s -f /home/$current_user/.zshrc /root/.zshrc
sudo mkdir /usr/share/zsh-sudo
sudo cp sudo.plugin.zsh /usr/share/zsh-sudo/
rm ~/.config/kitty/* &>/dev/null
mkdir ~/.config/kitty &>/dev/null
cp kitty.conf ~/.config/kitty/
cp color.ini ~/.config/kitty/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
cp .p10k.zsh ~/.p10k.zsh
sudo cp .p10k_root.zsh /root/.p10k.zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sudo /root/.fzf/install
sudo dpkg -i lsd_1.0.0_amd64.deb
echo 'Realizar instalación manual de NVChad https://nvchad.com/docs/quickstart/install debido a los cambios de versión'
