#!/bin/bash

#检察环境
if [ -f "/usr/bin/zsh" ]; then
  echo -e "\e[0;32m 已安装zsh\e[0m"
  shell=`echo $SHELL`
  if [[ $shell =~ "zsh" ]]; then
    echo -e "\e[0;32m当前使用终端工具:$shell\e[0m"
  else
    echo -e "\e[0;31m 请切换到zsh\e[0m"
  fi
  # 安装oh-my-zsh
  if [ ! -d  ~/.oh-my-zsh ]; then
    ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/shavchen/env_install_scripts/main/oh-my-zsh.sh)" > /dev/null 2>&1
    echo -e "\e[0;32m 已安装 oh-my-zsh \e[0m"
  fi
  if [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
    git clone git://github.com/zsh-users/zsh-autosuggestions  ~/.oh-my-zsh/plugins/zsh-autosuggestions > /dev/null 2>&1
    echo -e "\e[0;32m 已下载zsh-autosuggestions\e[0m"
  else
    echo "[*] ~/.oh-my-zsh/plugins/zsh-autosuggestions exists..."
  fi
  if [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting > /dev/null 2>&1
    echo -e "\e[0;32m 已下载zsh-syntax-highlighting.\e[0m"
  else
    echo "[*]  ~/.oh-my-zsh/plugins/zsh-syntax-highlighting  exists...."
  fi
 # 设置.zshrc
  cp ~/.zshrc ~/.zshrc.bak
  wget https://raw.githubusercontent.com/shavchen/env_install_scripts/main/.zshrc -O ~/.zshrc > /dev/null 2>&1
  echo -e "\e[0;32m 请手动执行 source ~/.zshrc 使配置生效\e[0m"
else
  echo -e "\e[0;31m 请安装zsh\e[0m"
fi
