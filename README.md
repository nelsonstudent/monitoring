### Descrição do Projeto

Este projeto tem como objetivo coletar métricas de um computador Windows e visualizá-las no Grafana. Para isso, serão utilizadas as seguintes ferramentas:

1. *Vagrant*: Para criar e gerenciar uma máquina virtual (VM) onde serão instalados o Prometheus, o OpenTelemetry Collector (otelcontrib) e o Grafana.
2. *Node Exporter*: Um agente que coleta métricas do sistema Windows e as expõe em um endpoint.
3. *Prometheus*: Um sistema de monitoramento que armazena as métricas coletadas.
4. *OpenTelemetry Collector (otelcontrib)*: Um coletor que processa as métricas do endpoint e as envia para o Prometheus.
5. *Grafana*: Uma ferramenta de visualização de dados que exibe as métricas armazenadas no Prometheus.

---

### Passo a Passo para Execução do Projeto

#### 1. Configuração do Node Exporter no Windows
- Baixe o *Windows Exporter* (Node Exporter para Windows) no link: [https://github.com/prometheus-community/windows_exporter/releases](https://github.com/prometheus-community/windows_exporter/releases).
- Após a instalação, o Windows começará a exportar métricas para o endpoint http://localhost:9182/metrics.

#### 2. Configuração do Ambiente com Vagrant
- Utilize o *Vagrantfile* fornecido para subir uma máquina virtual. Este arquivo configura a VM com os recursos necessários para rodar o Prometheus, otelcontrib e Grafana.
- Execute o comando vagrant up para iniciar a máquina virtual.
- Conecte-se à VM usando o comando vagrant ssh.

#### 3. Instalação e Configuração das Ferramentas na VM
Dentro da máquina virtual, siga os scripts fornecidos para instalar e configurar as ferramentas na seguinte ordem:

1. *Prometheus*:
   - Instale o Prometheus e configure-o para coletar as métricas do endpoint do Windows (http://<IP_DO_WINDOWS>:9182/metrics).
   - No arquivo de configuração do Prometheus (prometheus.yml), defina um job_name como "windows" para identificar as métricas do Windows.
   - Acesse o Prometheus em http://172.10.10.100:9090 para verificar as métricas coletadas (procure por métricas iniciadas com "windows").

2. *OpenTelemetry Collector (otelcontrib)*:
   - Instale o otelcontrib, que atuará como um coletor intermediário para processar as métricas do endpoint do Windows e enviá-las ao Prometheus.
   - Configure o otelcontrib para se conectar ao endpoint do Windows e ao Prometheus.

3. *Grafana*:
   - Instale o Grafana e configure-o para usar o Prometheus como fonte de dados (datasource).
   - Acesse o Grafana em http://172.10.10.100:3000 e utilize as credenciais padrão (usuário: admin, senha: admin).
   - Crie dashboards para visualizar as métricas coletadas do Windows.

---

#### 4. Verificação das Métricas
- As métricas do Windows podem ser verificadas diretamente no endpoint http://localhost:9182/metrics.
- No Prometheus, as métricas podem ser consultadas em http://172.10.10.100:9090.
- No Grafana, as métricas podem ser visualizadas em dashboards personalizados.

---

### Considerações Finais
Este projeto permite a coleta, processamento e visualização de métricas de um sistema Windows utilizando uma stack moderna de monitoramento. Certifique-se de que todas as ferramentas estejam corretamente configuradas e que a comunicação entre elas funcione conforme esperado.



