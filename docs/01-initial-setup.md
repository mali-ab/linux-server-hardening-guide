# 01 - Initial Server Setup

## Goals

- Create a non-root administrator account
- Configure secure `sudo` access
- Disable password authentication for SSH
- Enable SSH keys and optionally MFA
- Set hostname, timezone, and basic system info

## Recommended Steps

1. Update the system packages.

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Create a non-root user.

   ```bash
   sudo adduser adminuser
   sudo usermod -aG sudo adminuser
   ```

3. Harden `sudo`.

   - Use the `sudoers` file or `/etc/sudoers.d/`.
   - Avoid passwordless sudo unless required.

4. Set hostname and timezone.

   ```bash
   sudo hostnamectl set-hostname secure-server
   sudo timedatectl set-timezone UTC
   ```

5. Secure the SSH key directory for the new user.

   ```bash
   sudo mkdir -p /home/adminuser/.ssh
   sudo chmod 700 /home/adminuser/.ssh
   sudo chown adminuser:adminuser /home/adminuser/.ssh
   ```

6. Deploy public SSH keys.

   ```bash
   cat id_rsa.pub | sudo tee /home/adminuser/.ssh/authorized_keys
   sudo chmod 600 /home/adminuser/.ssh/authorized_keys
   sudo chown adminuser:adminuser /home/adminuser/.ssh/authorized_keys
   ```

## Notes

- Use strong passphrases for private keys.
- Keep the root account disabled for remote login.
- Document the account and access process for the team.
