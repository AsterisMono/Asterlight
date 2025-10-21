#!/bin/bash

set -ouex pipefail

### Install packages

# Clash verge rev
wget -O /tmp/clash.rpm https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.4.2/Clash.Verge-2.4.2-1.x86_64.rpm
dnf5 install -y /tmp/clash.rpm
sudo tee /etc/systemd/system/clash-verge.service > /dev/null <<'EOF'
[Unit]
Description=Clash Verge Service helps to launch Clash Core.
After=network-online.target nftables.service iptables.service

[Service]
Type=simple
ExecStart=/usr/bin/clash-verge-service
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
systemctl enable clash-verge.service