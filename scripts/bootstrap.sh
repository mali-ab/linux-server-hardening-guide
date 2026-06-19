#!/usr/bin/env bash

# bootstrap.sh - Run a safe bootstrap of common hardening steps
# Usage: sudo ./bootstrap.sh --user NAME --password PASS [--pubkey /path/to/key]

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run as root (sudo)." >&2
  exit 1
fi

# Minimal argument parsing
USER_ARG=""
PASS_ARG=""
PUBKEY_ARG=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --user) USER_ARG="$2"; shift 2;;
    --password) PASS_ARG="$2"; shift 2;;
    --pubkey) PUBKEY_ARG="$2"; shift 2;;
    --sudo) SUDO_FLAG="--sudo"; shift 1;;
    *) echo "Unknown arg: $1"; exit 1;;
  esac
done

if [[ -z "$USER_ARG" || -z "$PASS_ARG" ]]; then
  echo "Usage: $0 --user NAME --password PASS [--pubkey /path/to/key] [--sudo]" >&2
  exit 1
fi

# Call the helper scripts included in this repo
./scripts/add_user.sh "$USER_ARG" "$PASS_ARG" --sudo "$PUBKEY_ARG"
./scripts/ssh-hardening.sh
./scripts/firewall-setup.sh
./scripts/setup-unattended.sh
./scripts/install-fail2ban.sh

cat <<EOF
Bootstrap completed. Please verify:
- SSH configuration in /etc/ssh/sshd_config
- Firewall rules
- Unattended-upgrades status
- Fail2ban status
EOF