# 🧭 Cenário 02 – Roteamento com Políticas (PBR) / Policy-Based Routing

Neste cenário, o tráfego de redes distintas é roteado por caminhos diferentes com base na origem, utilizando tabelas de roteamento separadas.

In this scenario, traffic from different networks is routed via distinct gateways based on its origin, using custom routing tables.

---

## 🧱 Topologia ASCII

         +----------------------------+
         |     Ubuntu PBR Router     |
         |----------------------------|
         | enp0s3: 192.168.10.1       |
         | enp0s8: 192.168.20.1       |
         | enp0s9: 10.0.0.2 (WAN1)    |
         | enp0s10: 10.1.0.2 (WAN2)   |
         +----------------------------+
                |             |
         [ WAN1 gw:10.0.0.1 ] [ WAN2 gw:10.1.0.1 ]


---

## 🎯 Objetivo

- Utilizar `ip rule` para criar políticas de roteamento
- Separar o tráfego por origem de rede (LAN A vs LAN B)
- Garantir que o tráfego saia por gateways distintos conforme a origem

---

## 📂 Tabelas personalizadas

Adicione no arquivo `/etc/iproute2/rt_tables`:

```bash
100 wan1
200 wan2
```

## 🔧 Comandos principais:

    # Cria rotas para cada tabela
    ip route add default via 10.0.0.1 dev enp0s9 table wan1
    ip route add default via 10.1.0.1 dev enp0s10 table wan2

    # Cria regras por origem de tráfego
    ip rule add from 192.168.10.0/24 table wan1
    ip rule add from 192.168.20.0/24 table wan2

---

## 📘 Próximo passo sugerido

    Adicionar NAT para as redes LAN com iptables

    Monitorar rotas com ip route show table [table]
