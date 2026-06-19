#!/usr/bin/env bash

# install-fail2ban.sh - Install and apply a basic Fail2ban configuration

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root (sudo)." >&2
  exit 1
fi

apt-get update
apt-get install -y fail2ban

cat > /etc/fail2ban/jail.d/defaults.local <<'EOF'
[sshd]
enabled = true
port = ssh
maxretry = 5
bantime = 3600
EOF

systemctl enable --now fail2ban

echo "Fail2ban installed and basic sshd jail enabled."