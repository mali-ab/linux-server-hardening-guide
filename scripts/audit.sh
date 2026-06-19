#!/usr/bin/env bash

# Audit helper script to gather basic hardening checks.

set -euo pipefail

echo "== Host Information =="
uname -a

echo "\n== SSH Configuration =="
grep -E '^PermitRootLogin|^PasswordAuthentication|^ChallengeResponseAuthentication|^PubkeyAuthentication|^AllowUsers' /etc/ssh/sshd_config || true

echo "\n== UFW Status =="
sudo ufw status verbose || true

echo "\n== Users in sudo group =="
getent group sudo

echo "\n== Failed login attempts =="
sudo journalctl -u sshd --since "24 hours ago" | tail -n 20 || true
