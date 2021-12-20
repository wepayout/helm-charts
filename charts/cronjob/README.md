# Chart: CronJob

Este é um chart genérico para a criação de objetos `CronJob` em um cluster,
possui um várias formas de customização através do uso de suas variáveis, para
que não haja necessidade de alterá-lo, 

## O que é o Helm?

Resumindo um gerenciador de pacotes de aplicações do Kubernetes. Cada aplicação
no Kubernetes é um conjunto de definições YAML, o Helm definiu um padrão para
a criação desses arquivos e juntamente com o `GoTemplate` criou um pacote que
chamamos de **chart**.

A instalação de um chart acontece em um `Namespace` do Kubernetes e gera uma
**release**, podemos ter diversas releases de um mesmo chart, contanto que seus
nomes não se repitam dentro de um mesmo `Namespace`.

A definição dos charts também possui diversos valores, que podemos utilizar no
`GoTemplate` para gerar as definições dos objetos Kubernetes YAML.

## Como usar esse chart?

Primeiramente, é necessário adicionar o repositório da WePayOut e deixá-lo
disponível para o comando abaixo:

```bash
helm repo add wepayout https://wepayout.github.io/helm-charts
helm repo update
```

Adicionado o repositório, o chart `wepayout/cronjob` pode ser instalado:

```bash
helm install ${nome_da_release} wepayout/cronjob
```
