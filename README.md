Este projeto tem como pré-requisito o conhecimento em Vagrant.

O projeto é para pegar as métricas do meu computador Windows e levá-las até o grafana. Para isso foi necessário ter o node exporter baixado no meu computador para que este exporte as métricas do mesmo para um endpoint. 
Este endpoint será o número do ip da sua máquina na porta 9182. O node exporter você consegue baixar aqui: https://github.com/prometheus-community/windows_exporter/releases
Após seu windows já estará exportando as métricas.

Use o Vagrantfile para subir uma máquina virtual onde você vai instalar o prometheus, otelcontrib e grafana.

Uma vez a máquina UP, use o comando <vangrant ssh> para se conectar nela. Dentro dela execute o passo a passo informados nos scripts prometheus, otelcontrib e grafana. Nesta ordem.

O otelcontrib será o coletor do Opentelemetry que vai pegar as métricas no endpoint gerado para processá-las e em seguida armazená-las no banco de dados do prometheus.

No grafana use as senhas padrão e adicione o prometheus como datasource.

As métricas geradas pelo seu windows você poderá ter acesso em http://localhost:9182/metrics.
As métricas no Prometheus você acessa em http://172.10.10.100:9090. - aqui procura as métricas iniciadas com "windows" que é o job_name dado no arquivo de config.
O grafana você terá acesso em http://172.10.10.100:3000.



