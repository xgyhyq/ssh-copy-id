# ssh-copy-id
自动创建 SSH 密钥对，将公钥复制到远程主机，以便实现无密码登录和安全的远程连接。

Automatically generate an SSH key pair, copy the public key to the remote host, enabling password-less login and secure remote connections.

这个脚本主要完成了以下几个任务：
1. 提示用户输入 SSH 密钥的注释，用于标识密钥。
2. 提示用户输入远程主机的用户名、地址或 IP 和端口号。
3. 检查系统中是否已安装 ssh-keygen，如果没有安装，则自动安装 openssh-client。
4. 使用 ssh-keygen 生成 SSH 密钥对（公钥和私钥），密钥类型为 RSA，密钥长度为 2048 位，注释为用户输入的注释。
5. 将生成的公钥复制到远程主机，以便在未来通过 SSH 连接时无需输入密码。
6. 显示本地私钥的存储路径。
这个脚本的主要目的是为了方便用户在本地生成 SSH 密钥对，并将公钥复制到远程主机，以实现免密码登录。

This script primarily accomplishes the following tasks:
1. Prompt the user to enter a comment for the SSH key, which serves as an identifier for the key.
2. Prompt the user to enter the remote host's username, address or IP, and port number.
3. Check if ssh-keygen is installed on the system; if not, automatically install the openssh-client.
4. Generate an SSH key pair (public and private keys) using ssh-keygen, with the key type being RSA, key length of 2048 bits, and a comment as entered by the user.
5. Copy the generated public key to the remote host, allowing for password-less connections via SSH in the future.
6. Display the local private key's storage path.
The main purpose of this script is to facilitate the user in generating an SSH key pair locally and copying the public key to the remote host, enabling password-less login.
