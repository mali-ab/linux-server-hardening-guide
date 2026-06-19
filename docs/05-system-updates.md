# 05 - System Updates and Patch Management

## Goals

- Keep packages current
- Apply security updates promptly
- Use automation when appropriate

## Manual update commands

```bash
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
```

## Automatic security updates

```bash
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades
```

## Recommendations

- Enable unattended security updates on production servers.
- Test updates in a staging environment before rollout.
- Track package versions for critical services.
- Use configuration management or package automation for consistency.
