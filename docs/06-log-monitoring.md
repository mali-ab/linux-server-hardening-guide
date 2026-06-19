# 06 - Monitoring and Logging

## Goals

- Centralize logs where possible
- Monitor for suspicious behavior
- Retain logs for investigation

## Local tools

- `journalctl`
- `rsyslog`
- `auditd`

## Auditd example

```bash
sudo apt install auditd audispd-plugins
sudo systemctl enable --now auditd
```

## Monitoring stacks

- Wazuh
- Prometheus
- Grafana

## Best practices

- Keep logs off the host when possible.
- Use host-based monitoring for audit events.
- Alert on failed logins, sudo abuse, and configuration changes.
