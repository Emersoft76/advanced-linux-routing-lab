```markdown
# 🧱 Topologias ASCII – Cenários de Roteamento

Diagramas simples para ilustrar cada cenário do laboratório.
```
---

## 🗺️ Cenário 01 – Roteamento Estático
[ LAN 1 ] [ Ubuntu Router ] [ LAN 2 ] 192.168.10.0/24 ←→ enp0s3 [ Ubuntu ] enp0s8 ←→ 192.168.20.0/24 PC1 (routing) PC2

---

## 🧭 Cenário 02 – PBR (Policy-Based Routing)
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

## 🌐 Cenário 03 – NAT Gateway
[ LAN: 192.168.50.0/24 ] ←→ [ Ubuntu NAT Router ] ←→ [ Internet ] enp0s3 enp0s8 (WAN)

---

## 📡 Cenário 04 – OSPF com FRR
[ LAN A ]—[ Ubuntu R1 ]←→ OSPF ←→[ Ubuntu R2 ]—[ LAN B ] 192.168.10.0/24 10.0.0.1 10.0.0.2 192.168.20.0/24

---
