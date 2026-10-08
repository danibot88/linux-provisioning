# Provisionamento de Infraestrutura Linux com Bash

## Descrição

Projeto desenvolvido para automatizar o provisionamento de usuários, grupos, diretórios e permissões em um servidor Linux utilizando Bash Script.

O objetivo é permitir que a infraestrutura seja configurada automaticamente em novas instalações do Ubuntu Server.

## Tecnologias utilizadas

- Ubuntu Server
- Bash Script
- Git e GitHub

## Estrutura de diretórios

O script cria quatro diretórios na raiz do sistema:

```text
/publico
/adm
/ven
/sec
```

## Grupos e usuários

| Grupo | Usuários |
|---|---|
| GRP_ADM | carlos, maria, joao |
| GRP_VEN | debora, sebastiana, roberto |
| GRP_SEC | josefina, rogerio, amanda |

## Permissões

Todos os diretórios possuem `root` como proprietário.

| Diretório | Grupo | Permissão |
|---|---|---|
| /publico | root | 1777 |
| /adm | GRP_ADM | 770 |
| /ven | GRP_VEN | 770 |
| /sec | GRP_SEC | 770 |

- O diretório `/publico` permite acesso a todos os usuários, com proteção de sticky bit.
- Cada grupo possui acesso total ao seu respectivo diretório.
- Usuários de outros grupos não possuem acesso aos diretórios restritos.

## Como executar

Em um servidor Ubuntu, acesse a pasta do projeto e execute:

```bash
sudo bash provision.sh
```

O script precisa de privilégios administrativos para criar usuários, grupos e diretórios.

## Validação

O provisionamento foi testado em uma máquina virtual Ubuntu Server.

Foram realizados testes de criação de usuários, associação aos grupos, permissões de acesso e reexecução do script.

## Observações

O script não define senhas iniciais dos usuários. A configuração de senhas pode ser realizada separadamente pelo administrador do sistema.

## Objetivo educacional

Projeto prático de Infraestrutura como Código (IaC), desenvolvido para exercitar automação de tarefas administrativas em ambientes Linux.