#!/bin/bash
sudo yum install zsh
sudo yum install git

# install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# install zsh plugins
cd ~/.oh-my-zsh/plugins
git clone git://github.com/zsh-users/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting

# ssh config
sudo service sshd start
my_ip=`ifconfig -a|grep inet|grep Bcast|awk '{print $2}'`
echo local $my_ip
