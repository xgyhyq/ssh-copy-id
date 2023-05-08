#!/bin/bash

# 提示用户输入SSH密钥注释
read -p "请输入用于标识该密钥的注释: " comment

# 提示用户输入远程主机信息
read -p "请输入远程主机的用户名: " remote_username
read -p "请输入远程主机的地址或IP: " remote_hostname
read -p "请输入远程主机的端口号(默认22): " remote_port
# 检查SSH keygen是否安装
if ! command -v ssh-keygen &> /dev/null
then
    echo "SSH keygen 未安装, 正在安装..."
    sudo apt-get update
    sudo apt-get install -y openssh-client
fi

# 生成SSH密钥对
if ssh-keygen -t rsa -b 2048 -C "$comment"
then
    echo "SSH密钥对已生成"
else
    echo "无法生成SSH密钥对, 请检查安装"
    exit 1
fi

# 复制公钥到远程主机
if ssh-copy-id -p $remote_port $remote_username@$remote_hostname
then
    echo "公钥已复制到远程主机"
else
    echo "无法复制公钥到远程主机"
    exit 1
fi

# 显示本地私钥路径
if [ -f "$HOME/.ssh/id_rsa" ]
then
    echo "SSH密钥对已生成, 存储在本地路径: $HOME/.ssh/id_rsa"
else
    echo "无法找到SSH密钥对文件"
    exit 1
fi
