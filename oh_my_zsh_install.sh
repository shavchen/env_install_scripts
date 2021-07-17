#!/bin/bash

#检察环境
if [ -f "/usr/bin/zsh" ]; then
  echo -e "\e[0;32m 已安装zsh\e[0m"
  shell=`echo $SHELL`
  if [[ $shell =~ "zsh" ]]; then
    echo -e "\e[0;32m 当前使用终端工具:$shell\e[0m"
  else
    echo -e "\e[0;31m 请切换到zsh\e[0m"
  fi
  # 安装oh-my-zsh
  if [ ! -d  ~/.oh-my-zsh ]; then
    ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/shavchen/env_install_scripts/main/oh-my-zsh.sh)" > /dev/null 2>&1
    echo -e "\e[0;32m 已安装 oh-my-zsh \e[0m"
  else
    echo -e "\e[0;31m oh-my-zsh exists...."
  fi
  if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    git clone git://github.com/zsh-users/zsh-autosuggestions  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null 2>&1
    cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    source zsh-autosuggestions.zsh
    echo -e "\e[0;32m 已下载zsh-autosuggestions\e[0m"
  else
    echo -e "\e[0;31m zsh-autosuggestions exists..."
  fi
  if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1
    echo -e "\e[0;32m 已下载zsh-syntax-highlighting.\e[0m"
    cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
    source zsh-syntax-highlighting.zsh
  else
    echo -e "\e[0;31m zsh-syntax-highlighting  exists...."
  fi
 # 设置.zshrc
  cp ~/.zshrc ~/.zshrc.bak 
  source ~/.zshrc
  echo -e "\e[0;32m 配置生效 \e[0m"
else
  echo -e "\e[0;31m 请安装zsh\e[0m"
fi
cd
