# 03 - SSH Hardening

## Objectives

- Disable root login
- Disable password authentication
- Use SSH keys exclusively
- Restrict access to specific users
- Optionally change the SSH port
- Configure Fail2ban or similar protection

## Example SSH settings (`/etc/ssh/sshd_config`)

```text
PermitRootLogin no
PasswordAuthentication no
ChallengeResponseAuthentication no
PubkeyAuthentication yes
AllowUsers adminuser
Port 22
```

## Optional hardening

- Change `Port` only if you understand the operational impact.
- Enable MFA with `google-authenticator` or an SSH certificate authority.
- Use `AllowGroups` to further restrict access.

## Fail2ban

Install and configure `fail2ban` to block repeated login failures.

```bash
sudo apt install fail2ban
sudo systemctl enable --now fail2ban
```

Sample jail config:

```ini
[sshd]
enabled = true
port = ssh
maxretry = 5
bantime = 3600
```