---

### ✅ `scripts/nat_config.sh`

```bash
#!/bin/bash

# nat_config.sh – Configuração de NAT e roteamento para gateway Ubuntu

echo "➤ Ativando IP forwarding..."
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

echo "➤ Aplicando regras NAT com iptables..."
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT
iptables -A FORWARD -i enp0s8 -o enp0s3 -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "➤ Tornando regras persistentes..."
apt install -y iptables-persistent
netfilter-persistent save

echo "✔️ NAT Gateway configurado com sucesso."
