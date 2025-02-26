# full-observability
Esse é um repositório, que vai instalar e provisionar toda a stack de observabilidade, com as ferramentas que vimos no curso.

## Como criar seu cluster ? 

- Primeiro passo é dar autorização de execução ao script de instalação do cluster kind
```bash
    chmod +x ./cluster/install/install.sh
```

- Após isso basta rodar o script de instalação 

```bash
    ./cluster/install/install.sh
```

## Como fazer deploy de toda a stack usando terraform

- Basta entrar na pasta terraform
```bash
    cd terraform
```

- E rodar os comando necessários para rodar o terraform
```bash
    terraform init \  
    && terraform apply -auto-approve 
```
