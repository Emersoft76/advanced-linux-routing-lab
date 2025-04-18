```markdown
# 🛠️ Instalação do FRRouting (FRR) no Ubuntu Server

---

## 1. Atualizar pacotes

```bash
sudo apt update
sudo apt install -y frr frr-pythontools
```
2. Ativar os daemons

Edite /etc/frr/daemons:
```bash
zebra=yes
ospfd=yes
```
3. Criar arquivo de configuração inicial

Crie /etc/frr/frr.conf com:
```
frr version 8.4
frr defaults traditional
hostname router
log file /var/log/frr.log
!
interface enp0s3
!
router ospf
 network 10.0.0.0/24 area 0
!
line vty
!
```
4. Habilitar e iniciar
```
sudo systemctl enable frr
sudo systemctl start frr
```
5. Verificar
```
vtysh -c "show ip route"
   
