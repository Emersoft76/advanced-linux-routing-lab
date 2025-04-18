# ⚙️ Scripts de Execução / Routing Scripts

Este diretório contém todos os scripts utilizados para configurar os cenários de roteamento descritos no laboratório.

This directory includes all shell scripts used to configure and automate the routing scenarios covered in the lab.

---

## 📄 Lista de Scripts / Script List

| Script                            | Descrição / Description                                |
|----------------------------------|---------------------------------------------------------|
| [`static_routing.sh`](./static_routing.sh)       | Ativa IP forwarding e configura roteamento estático    |
| [`policy_routing.sh`](./policy_routing.sh)       | Define regras de roteamento com base na origem (PBR)   |
| [`nat_config.sh`](./nat_config.sh)               | Aplica NAT com `iptables` para compartilhar internet    |
| [`frr_startup.sh`](./frr_startup.sh)             | Ativa daemons do FRR e configura OSPF básico            |

---

## ✅ Uso básico

```
sudo bash nome_do_script.sh
```
---

## 📘 Próximo passo sugerido

* Tornar os scripts idempotentes (reexecutáveis sem erro)

* Adicionar logs de execução por data e interface
