# Chart: <CHARTNAME>

Este é um chart inicial, servindo de base para aplicações da WePayOut que serão
implantadas via Helm.

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

Primeiramente, é necessário clonar esse repositório e deixá-lo disponível para
o comando abaixo:

```bash
helm create ${nome_do_novo_chart} --starter ${caminho_absoluto_para_o_starter_chart}
```

É necessário seguir os seguintes passos:

1. alterar o `Deployment` para que ele dê o suporte necessário à apĺicação:
    1. verificar as portas expostas dos containers
    2. verificar a `livenessProbe`
    3. verificar a `readinessProbe`, para o caso da aplicação ser exposta por
    um `Service`
2. verificar se a configuração do `HorizontalPodAutoscaler` faz sentido para
essa aplicação
3. variáveis de ambiente devem ser inseridas nos containers dos pods através
dos argumentos `extraEnv` e `extraEnvFrom` do chart
4. verificar se é necessário expor a aplicação com um `Service`
5. verificar a criação do `VirtualService` e criar um para cada `Gateway`
necessário, caso contrário o **ExternalDNS** vai quebrar e não vai conseguir
criar os registro de DNS no **Route53** corretamente
6. fique à vontade para alterar o chart como julgar mais adequado para que sua
aplicação atinja os objetivos dela
7. alterar o `tests/test-connection.yaml` para que a release seja testada
apropriadamente
