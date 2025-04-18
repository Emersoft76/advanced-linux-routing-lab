```bash
#!/bin/bash

# policy_routing.sh – Configuração de roteamento com políticas (PBR)

echo "➤ Adicionando tabelas personalizadas..."
echo "100 wan1" >> /etc/iproute2/rt_tables
echo "200 wan2" >> /etc/iproute2/rt_tables

echo "➤ Criando rotas nas tabelas personalizadas..."
ip route add default via 10.0.0.1 dev enp0s9 table wan1
ip route add default via 10.1.0.1 dev enp0s10 table wan2

echo "➤ Aplicando regras baseadas na origem do tráfego..."
ip rule add from 192.168.10.0/24 table wan1
ip rule add from 192.168.20.0/24 table wan2

echo "✔️ Política de roteamento aplicada com sucesso."
```
