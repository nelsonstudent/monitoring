# prometheus 
 
# sudo apt update -y
 
# sudo useradd --no-create-home --shell /bin/false prometheus
# sudo mkdir /etc/prometheus
# sudo mkdir /var/lib/prometheus
 
# sudo chown -R prometheus:prometheus /etc/prometheus
# sudo chown -R prometheus:prometheus /var/lib/prometheus
 
# cd /tmp
# wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz
# tar xvfz prometheus-*.tar.gz
 
# cd prometheus-2.46.0.linux-amd64/
 
# sudo mv console* /etc/prometheus
# sudo mv prometheus.yml /etc/prometheus
 
# sudo chown -R prometheus:prometheus /etc/prometheus
 
# sudo mv prometheus /usr/local/bin/
# sudo chown prometheus:prometheus /usr/local/bin/prometheus
 
# sudo mv promtool /usr/local/bin/
# sudo chown prometheus:prometheus /usr/local/bin/promtool

# vim /etc/systemd/system/prometheus.service 

# criando o serviço do prometheus

# [Unit]
# Description=Prometheus
# Wants=network-online.target
# After=network-online.target
 
# [Service]
# User=prometheus
# Group=prometheus
# Type=simple
# ExecReload=/bin/kill -HUP $MAINPID
# ExecStart=/usr/local/bin/prometheus \
#     --config.file /etc/prometheus/prometheus.yml \
#     --storage.tsdb.path /var/lib/prometheus/ \
#     --web.console.templates=/etc/prometheus/consoles \
#     --web.console.libraries=/etc/prometheus/console_libraries \
#     --web.enable-remote-write-receiver
 
# [Install]
# WantedBy=multi-user.target

# systemctl enable prometheus
# service prometheus start
# service prometheus status
