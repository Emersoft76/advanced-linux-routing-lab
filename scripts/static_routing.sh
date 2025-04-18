#!/bin/bash

# static_routing.sh – Configuração de roteamento estático no Ubuntu

echo "➤ Ativando IP forwarding..."
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

echo "➤ Exibindo interfaces de rede disponíveis:"
ip a | grep -E "enp|eth"

echo "➤ Certifique-se de que as interfaces estão com IPs estáticos atribuídos via Netplan."

echo "➤ Configuração concluída. Adicione rotas nos clientes da LAN para garantir comunicação cruzada."
