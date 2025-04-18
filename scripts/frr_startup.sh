```bash
#!/bin/bash

# frr_startup.sh – Configuração rápida do OSPF via FRRouting

echo "➤ Ativando daemons zebra e ospfd..."
sed -i 's/zebra=no/zebra=yes/' /etc/frr/daemons
sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons

echo "➤ Criando arquivo de configuração padrão..."
cat <<EOF > /etc/frr/frr.conf
frr version 8.4
frr defaults traditional
hostname router
log file /var/log/frr.log
!
interface enp0s3
interface enp0s8
!
router ospf
 network 10.0.0.0/24 area 0
 network 192.168.10.0/24 area 0
!
line vty
!
EOF

echo "➤ Iniciando o serviço FRR..."
systemctl restart frr
systemctl enable frr

echo "✔️ FRRouting com OSPF configurado com sucesso!"
```
