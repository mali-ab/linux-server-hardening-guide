# 04 - Firewall Configuration

## Goals

- Block all unnecessary incoming traffic
- Permit required services only
- Allow outbound traffic by default

## UFW example

```bash
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

## nftables example

```bash
sudo apt install nftables
sudo tee /etc/nftables.conf <<'EOF'
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
  chain input {
    type filter hook input priority 0;
    policy drop;
    ct state established,related accept;
    iif lo accept;
    tcp dport {22,80,443} ct state new accept;
    ip protocol icmp accept;
  }
  chain forward {
    type filter hook forward priority 0;
    policy drop;
  }
  chain output {
    type filter hook output priority 0;
    policy accept;
  }
}
EOF
sudo systemctl enable --now nftables
```

## firewalld example

```bash
sudo apt install firewalld
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --zone=public --add-service=ssh
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
```