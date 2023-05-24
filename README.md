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
建议：当你创建SSH密钥对时，你可以为私钥设置一个passphrase。这将为私钥文件添加一层额外的安全性，即使私钥文件落入他人手中，如果他们不知道passphrase，他们也无法使用它。
运行脚本后当系统提示你输入文件保存位置时，你可以接受默认位置（通常是~/.ssh/id_rsa）或输入一个新的位置。
系统将提示你输入passphrase。这时你可以输入一个强密码作为passphrase。为了保证密码强度，你的passphrase应该：
至少包含12个字符。
包含大写和小写字母。
包含数字。
包含特殊字符，例如!@#$%^&*()。
系统将再次提示你确认passphrase。再次输入passphrase。
这样，你的SSH私钥就设置了一个强密码保护。每次使用私钥时，系统都会要求你输入passphrase。
注意：不要忘记你的passphrase，否则你将无法使用你的私钥。如果你担心忘记，你可以使用一个密码管理器来存储它。

This script mainly completes the following tasks:

1. Prompt the user to input a comment for the SSH key to identify it.

2. Prompt the user to input the username, address or IP, and port number of the remote host.

3. Check if ssh-keygen is installed in the system. If not, automatically install openssh-client.

4. Use ssh-keygen to generate an RSA type SSH key pair (public and private keys) with a length of 2048 bits and a comment specified by the user.

5. Copy the generated public key to the remote host so that password-free login can be achieved through SSH connection in future.

6. Display the storage path of local private key.

The main purpose of this script is to facilitate users in generating SSH key pairs locally and copying public keys to remote hosts for password-free login.

Suggestion: When creating an SSH key pair, you can set a passphrase for your private key which adds an extra layer of security even if someone else gains access to your private key file without knowing your passphrase.

After running this script, when prompted by system for file save location, you can accept default location (usually ~/.ssh/id_rsa) or enter a new one.

System will prompt you for passphrase input where you should enter a strong password as passphrase. To ensure strength of password:

- It should contain at least 12 characters

- It should include both uppercase and lowercase letters

- It should include numbers

- It should include special characters such as !@#$%^&*()

System will again prompt you for confirmation of passphrase where you need to re-enter it.

This way your SSH private key will have strong protection with a passphrase set up on it which will be required every time when using it.

Note: Do not forget your passphrase otherwise you won't be able use your private key anymore! You may consider using a password manager tool.
