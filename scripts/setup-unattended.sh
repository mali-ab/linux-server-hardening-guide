#!/usr/bin/env bash

# setup-unattended.sh - Install and configure unattended-upgrades for Debian/Ubuntu

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root (sudo)." >&2
  exit 1
fi

apt-get update
apt-get install -y unattended-upgrades apt-listchanges

# Enable automatic updates
dpkg-reconfigure -plow unattended-upgrades || true

cat > /etc/apt/apt.conf.d/50unattended-upgrades <<'EOF'
Unattended-Upgrade::Allowed-Origins {
  "${distro_id}:${distro_codename}-security";
};
Unattended-Upgrade::Automatic-Reboot "false";
EOF

systemctl enable --now unattended-upgrades

echo "Unattended upgrades installed and enabled."