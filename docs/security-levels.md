# Security Levels

This repository uses three progressive security profiles. Apply the level appropriate to your risk model.

- Level 1 — Basic (Small VPS)
  - Create one non-root admin user
  - Harden SSH (disable root/password auth)
  - Enable firewall (allow SSH, HTTP, HTTPS)
  - Enable unattended security updates

- Level 2 — Production
  - All Level 1 steps
  - Enforce stricter SSH restrictions (AllowUsers/AllowGroups)
  - Configure Fail2ban/CrowdSec
  - Centralized logging and monitoring
  - Regular backups and tested restores

- Level 3 — High-security
  - All Level 2 steps
  - Use short-lived credentials or SSH certificate authority
  - Disable unnecessary services and enforce SELinux/AppArmor
  - Isolate services in containers with strict profiles
  - Implement host-based IDS and frequent audits

Use the `scripts/bootstrap.sh` to apply a baseline (Level 1/2). Review each script before running in production.