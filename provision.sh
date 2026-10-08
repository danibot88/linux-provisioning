#!/bin/bash

set -e

# Verificar privilegios administrativos
if [[ "$EUID" -ne 0 ]]; then
    echo "Erro: execute este script como root (sudo)."
    exit 1
fi

# Criacao dos diretorios
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

# Criacao dos grupos
groupadd -f GRP_ADM
groupadd -f GRP_VEN
groupadd -f GRP_SEC

# Criacao dos usuarios do grupo administrativo
id carlos &>/dev/null || useradd -m -s /bin/bash -G GRP_ADM carlos
id maria &>/dev/null || useradd -m -s /bin/bash -G GRP_ADM maria
id joao &>/dev/null || useradd -m -s /bin/bash -G GRP_ADM joao

# Criacao dos usuarios do grupo vendas
id debora &>/dev/null || useradd -m -s /bin/bash -G GRP_VEN debora
id sebastiana &>/dev/null || useradd -m -s /bin/bash -G GRP_VEN sebastiana
id roberto &>/dev/null || useradd -m -s /bin/bash -G GRP_VEN roberto

# Criacao dos usuarios do grupo secretariado
id josefina &>/dev/null || useradd -m -s /bin/bash -G GRP_SEC josefina
id rogerio &>/dev/null || useradd -m -s /bin/bash -G GRP_SEC rogerio
id amanda &>/dev/null || useradd -m -s /bin/bash -G GRP_SEC amanda

# Garantir associacao dos usuarios aos grupos
# Administrativo
usermod -aG GRP_ADM carlos
usermod -aG GRP_ADM maria
usermod -aG GRP_ADM joao
# Vendas
usermod -aG GRP_VEN debora
usermod -aG GRP_VEN sebastiana
usermod -aG GRP_VEN roberto
# Seguranca
usermod -aG GRP_SEC josefina
usermod -aG GRP_SEC rogerio
usermod -aG GRP_SEC amanda

# Configuracao dos proprietarios e grupos
chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Configuracao das permissoes
chmod 1777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec