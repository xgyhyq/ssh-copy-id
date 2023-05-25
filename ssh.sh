#!/bin/bash

# 提示用户输入SSH密钥注释
while true; do
    read -p "请输入用于标识该密钥的注释 (Please enter a comment for the SSH key): " comment
    if [[ -z "$comment" ]]
    then
        echo "注释不能为空，请重新输入。"
    else
        break
    fi
done

# 提示用户输入远程主机信息
while true; do
    read -p "请输入远程主机的用户名 (Please enter the remote host's username): " remote_username
    if [[ -z "$remote_username" ]]
    then
        echo "用户名不能为空，请重新输入。"
    else
        break
    fi
done

while true; do
    read -p "请输入远程主机的地址或IP (Please enter the remote host's address or IP): " remote_hostname
    if [[ -z "$remote_hostname" ]]
    then
        echo "远程主机的地址或IP不能为空，请重新输入。"
    else
        break
    fi
done

while true; do
    read -p "请输入远程主机的端口号(默认22) (Please enter the remote host's port number(default 22)): " remote_port
    if [[ -z "$remote_port" ]]
    then
        echo "使用默认的SSH端口号22。"
        remote_port=22
        break
    elif ! [[ "$remote_port" =~ ^[0-9]+$ ]] || [[ "$remote_port" -lt 1 ]] || [[ "$remote_port" -gt 65535 ]]
    then
        echo "端口号必须是1-65535之间的数字，请重新输入。"
    else
        break
    fi
done

# 提示用户输入密钥长度
while true; do
    read -p "请输入SSH密钥长度 (例如2048或4096) (Please enter the SSH key length (e.g. 2048 or 4096)): " key_length
    if ! [[ "$key_length" =~ ^[0-9]+$ ]] || [[ "$key_length" -lt 1024 ]] || [[ "$key_length" -gt 16384 ]]
    then
        echo "SSH密钥长度必须是1024-16384之间的数字，请重新输入。"
    else
        break
    fi
done

# 检查SSH keygen是否安装
if ! command -v ssh-keygen &> /dev/null
then
    echo "SSH keygen 未安装, 正在安装... (SSH keygen is not installed, installing...)"
    sudo apt-get update
    sudo apt-get install -y openssh-client
fi

# 生成SSH密钥对
if ssh-keygen -t rsa -b $key_length -C "$comment"
then
    echo "SSH密钥对已生成 (SSH key pair has been generated)"
else
    echo "无法生成SSH密钥对, 请检查安装 (Unable to generate SSH key pair, please check installation)"
    exit 1
fi

# 复制公钥到远程主机
if ssh-copy-id -p $remote_port $remote_username@$remote_hostname
then
    echo "公钥已复制到远程主机 (Public key has been copied to the remote host)"
else
    echo "无法复制公钥到远程主机 (Unable to copy public key to remote host)"
    exit 1
fi

# 显示本地私钥路径
if [ -f "$HOME/.ssh/id_rsa" ]
then
    echo "SSH密钥对已生成, 存储在本地路径: $HOME/.ssh/id_rsa (SSH key pair has been generated, stored in local path: $HOME/.ssh/id_rsa)"
else
    echo "无法找到SSH密钥对文件 (Unable to find SSH key pair file)"
    exit 1
fi
