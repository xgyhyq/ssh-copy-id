<!DOCTYPE html>
<html>
    <head>
        <title>SSH Key Pair Generation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1, h2 {
                color: #333;
            }
            p {
                line-height: 1.6;
            }
        </style>
    </head>
    <body>
        <h1>Automatically generate an SSH key pair</h1>
        <p>Automatically generate an SSH key pair, copy the public key to the remote host, enabling password-less login and secure remote connections.</p>

        <h2>Script Tasks:</h2>
        <ol>
            <li>Prompt the user to enter a comment for the SSH key, which is used to identify the key.</li>
            <li>Prompt the user to enter the username, address, or IP and port number of the remote host.</li>
            <li>Check whether ssh-keygen is installed in the system. If not, automatically install openssh-client.</li>
            <li>Use ssh-keygen to generate an SSH key pair (public and private keys). The key type is RSA, the key length is 2048 bits, and the comment is the user-entered comment.</li>
            <li>Copy the generated public key to the remote host, so that no password is required when connecting via SSH in the future.</li>
            <li>Display the storage path of the local private key.</li>
        </ol>

        <p>The main purpose of this script is to facilitate users to generate an SSH key pair locally and copy the public key to the remote host to achieve password-less login.</p>

        <h2>Recommendations and Precautions:</h2>
        <p>When you create an SSH key pair, you can set a passphrase for the private key. This will add an extra layer of security to the private key file. Even if the private key file falls into the hands of others, they cannot use it if they do not know the passphrase.</p>

        <p>When the system prompts you to enter the file save location after running the script, you can accept the default location (usually ~/.ssh/id_rsa) or enter a new location.</p>

        <p>The system will prompt you to enter a passphrase. At this time, you can enter a strong password as the passphrase. To ensure password strength, your passphrase should:
            <ul>
                <li>Contain at least 12 characters.</li>
                <li>Contain uppercase and lowercase letters.</li>
                <li>Contain numbers.</li>
                <li>Contain special characters, such as !@#$%^&*().</li>
            </ul>
        </p>
        
        <p>The system will prompt you again to confirm the passphrase. Enter the passphrase again.</p>

        <p>In this way, your SSH private key is set with a strong password protection. Each time you use the private key, the system will ask you to enter the passphrase.</p>

        <p><strong>Attention: </strong>Do not forget your passphrase, otherwise you will not be able to use your private key. If you are worried about forgetting, you can use a password manager to store it.</p>
    </body>
</html>


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
