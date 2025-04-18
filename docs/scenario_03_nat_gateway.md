# 🌐 Cenário 03 – NAT Gateway / Internet Access via NAT

Neste cenário, o Ubuntu Server atua como gateway NAT, permitindo que dispositivos da LAN acessem a internet por meio de uma única interface externa (WAN).

In this scenario, Ubuntu Server acts as a NAT gateway, allowing LAN devices to reach the internet via a single WAN interface.

---

## 🧱 Topologia ASCII

[ LAN: 192.168.50.0/24 ] ←→ [ Ubuntu NAT Router ] ←→ [ Internet ] enp0s3 enp0s8 (WAN)

---

## 🎯 Objetivo

- Ativar IP forwarding
- Aplicar NAT com `iptables` para mascarar o tráfego da LAN
- Garantir conectividade entre os clientes e a internet

---

## 🔧 Comandos principais

```bash
# Ativar roteamento
sysctl -w net.ipv4.ip_forward=1

# Tornar persistente
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# Aplicar NAT (masquerade)
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE

# Permitir encaminhamento
iptables -A FORWARD -i enp0s3 -o enp0s8 -j ACCEPT
iptables -A FORWARD -i enp0s8 -o enp0s3 -m state --state RELATED,ESTABLISHED -j ACCEPT

## 💾 Tornar regras persistentes

sudo apt install iptables-persistent
sudo netfilter-persistent save

## ▶️ Execução via script

Utilize o script nat_config.sh:

sudo bash nat_config.sh

---

## 📘 Próximo passo sugerido

    Adicionar logs e monitoramento com tcpdump

    Criar failover para múltiplos links com ip route
