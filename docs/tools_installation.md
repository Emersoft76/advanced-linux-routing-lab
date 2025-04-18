# 🔧 Instalação de Ferramentas de Diagnóstico de Rede / Network Tools Installation

Este guia reúne os comandos para instalar e utilizar ferramentas auxiliares de rede no Ubuntu Server — úteis para diagnóstico, testes de conectividade e monitoramento de tráfego.

This guide provides commands to install and use network tools in Ubuntu Server — useful for diagnostics, connectivity tests and traffic monitoring.

---

## 🛠️ Ferramentas abordadas / Tools Covered

| Ferramenta       | Função Principal / Main Function               |
|------------------|------------------------------------------------|
| `net-tools`      | Comandos como `ifconfig`, `netstat`            |
| `iputils-ping`   | Ping e verificação de conectividade            |
| `traceroute`     | Rota de pacotes até o destino final            |
| `iperf3`         | Teste de velocidade entre duas máquinas         |
| `tcpdump`        | Captura de pacotes na rede                     |
| `nmap` (opcional)| Scanner de portas e serviços                   |

---

## 📦 Instalação das ferramentas

```bash
sudo apt update

# Ferramentas básicas de rede
sudo apt install -y net-tools iputils-ping traceroute

# Ferramentas de teste e análise
sudo apt install -y iperf3 tcpdump

# Ferramenta de scanner de rede (opcional)
sudo apt install -y nmap
```
---
## ✅ Testes básicos
🔍 Ver IPs e interfaces:
```
ip a
ifconfig        # requer net-tools
```
📡 Testar conectividade:
```
ping 8.8.8.8
traceroute 8.8.8.8
```
⚙️ Testar throughput com iperf3

  Em uma máquina:
```
iperf3 -s
```
  Em outra máquina na rede:
```
iperf3 -c [IP_DO_SERVIDOR]
```
🛡️ Capturar pacotes
```
sudo tcpdump -i enp0s3
```
---

## 📘 Próximo passo sugerido
* Usar tcpdump para monitorar pacotes entre redes roteadas

* Aplicar iperf3 entre máquinas em sub-redes diferentes

* Adicionar essas ferramentas aos seus scripts de diagnóstico



