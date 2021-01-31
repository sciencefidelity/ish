#! /bin/bash

apk update
apk upgrade

apk add openssh openrc tmux curl vim coreutils tar busybox-extras grep sudo bash

rm /etc/inittab
curl https://raw.githubusercontent.com/sciencefidelity/ish/main/inittab -o /etc/inittab

# Set up SSHD

ssh-keygen -A
rc-update add sshd
curl https://raw.githubusercontent.com/sciencefidelity/ish/main/sshd_config -o /etc/ssh/sshd_config

chmod 777 /dev/null

# Build the dotfiles

wget https://raw.githubusercontent.com/sciencefidelity/ish/main/.profile
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.bash_profile
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.vimrc

mkdir .vim
mkdir .vim/colors

curl https://raw.githubusercontent.com/lifepillar/vim-gruvbox8/master/colors/gruvbox8.vim -o .vim/colors/gruvbox8.vim
curl https://raw.githubusercontent.com/lifepillar/vim-wwdc16-theme/master/colors/wwdc16.vim -o .vim/colors/wwdc16.vim

rm /etc/motd
curl https://raw.githubusercontent.com/sciencefidelity/ish/main/motd -o /etc/motd

# Set up networking

rm /etc/init.d/networking
curl https://raw.githubusercontent.com/sciencefidelity/ish/main/networking -o /etc/init.d/networking

# Set up Apache2
