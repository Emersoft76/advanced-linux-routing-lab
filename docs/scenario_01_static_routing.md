# 🗺️ Cenário 01 – Roteamento Estático / Static Routing

Este cenário simula um servidor Ubuntu com duas interfaces, cada uma conectada a uma rede distinta, realizando o roteamento estático entre elas.

This scenario simulates a Ubuntu server with two interfaces, each connected to a different subnet, performing static routing between them.

---

## 🧱 Topologia ASCII

[ LAN 1 ] [ Ubuntu Router ] [ LAN 2 ] 192.168.10.0/24 ←→ enp0s3 [ Ubuntu ] enp0s8 ←→ 192.168.20.0/24 PC1 (routing) PC2

---

## ⚙️ Objetivo

- Ativar o encaminhamento de pacotes (IP forwarding)
- Adicionar rotas estáticas
- Garantir que PC1 e PC2 possam se comunicar através do roteador Linux

---

## ✅ Pré-requisitos

- Ubuntu Server com pelo menos 2 NICs (ex: enp0s3 e enp0s8)
- Interfaces configuradas com IP estático usando `netplan`

---

## 🔧 Comandos utilizados

```bash
# Ativar roteamento de pacotes
sudo sysctl -w net.ipv4.ip_forward=1

# Tornar permanente
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# Adicionar rotas (exemplo em cada estação cliente)
# Em PC1 (Linux):
sudo ip route add 192.168.20.0/24 via 192.168.10.1

# Em PC2:
sudo ip route add 192.168.10.0/24 via 192.168.20.1
```

## ▶️ Execução via script

Você pode usar o script static_routing.sh para aplicar as configurações rapidamente no Ubuntu Server.
```bash
sudo bash static_routing.sh
```
---

## 📘 Próximo passo sugerido

      Criar um cenário com múltiplas tabelas de roteamento (Policy-Based Routing)

      Integrar firewall com iptables ou ufw
