# 🧷 Configuração Básica com Netplan / Basic Network Setup with Netplan

Este guia mostra como configurar IP fixo, gateway e DNS usando o Netplan, padrão de configuração de rede no Ubuntu Server.

This guide shows how to configure static IP, gateway and DNS using Netplan — the default network configuration tool in Ubuntu Server.

---

## 📌 Arquivo de configuração Netplan

Por padrão, o arquivo fica em:

```
/etc/netplan/00-installer-config.yaml
```
Ou:
```
/etc/netplan/00-static.yaml
```
## 📄 Exemplo de configuração (estática):
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.50.10/24]
      gateway4: 192.168.50.1
      nameservers:
        addresses: [192.168.50.1, 8.8.8.8]

## ⚙️ Aplicar configuração
Após editar o arquivo:
```
sudo netplan apply
```

## ✅ Verificar se funcionou:
```
ip a        # Verificar IP atribuído
ip route    # Verificar gateway e rotas
ping 8.8.8.8
```

## ⚠️ Dicas importantes:
* Verifique se a interface (enp0s3, eth0, etc.) está correta com ip link

* Sempre mantenha a indentação correta no YAML (espaços, não tabulação)

* Caso perca a conexão via SSH após netplan apply, verifique com acesso direto à VM

## 📘 Próximo passo sugerido

* Configurar múltiplas interfaces com IPs estáticos

* Criar regras com ip rule baseadas em interfaces distintas

* Usar Netplan com bridges ou VLANs (cenários mais avançados)
