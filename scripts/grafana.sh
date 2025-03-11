# grafana
 
sudo apt-get install -y apt-transport-https software-properties-common wget
 
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add - # exportando a chave do grafana
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list # adicionando a chave na lista
 
sudo apt-get update
sudo apt-get install -y grafana
 
sudo systemctl restart grafana-server
sudo systemctl enable grafana-server
