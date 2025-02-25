## 1. Download Promtail

```sh
curl -O -L "https://github.com/grafana/loki/releases/latest/download/promtail-linux-amd64.zip"
unzip promtail-linux-amd64.zip
chmod +x promtail-linux-amd64
sudo mv promtail-linux-amd64 /usr/local/bin/promtail
```

## 2. Create Promtail Config File

```sh
nano promtail-config.yml
```

```yaml
server:
  http_listen_port: 9080  # Promtail’s local API, does NOT affect Loki forwarding
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://54.165.147.35:3100/loki/api/v1/push  # Ensure Loki is reachable

scrape_configs:
- job_name: system
  static_configs:
  - targets:
      - localhost
    labels:
      job: varlogs
      __path__: /var/log/*.log
      logtype: system

- job_name: log-gen
  static_configs:
  - targets:
      - localhost  # Keep it localhost if logs are on the same node
    labels:
      job: applog
      __path__: /opt/*.log
      logtype: application
```

## 3. Run Promtail as a Background Service

```sh
sudo nano /etc/systemd/system/promtail.service
```

```ini
[Unit]
Description=Promtail Log Collector
After=network.target

[Service]
ExecStart=/usr/local/bin/promtail -config.file=/home/youruser/promtail-config.yml
Restart=always
User=youruser

[Install]
WantedBy=multi-user.target
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable promtail
sudo systemctl start promtail
```

## Test Promtail Sending Logs to Loki

```sh
curl -G "http://54.165.147.35:3100/loki/api/v1/labels"
```

If it returns labels (e.g., `varlogs`, `applog`), Promtail is sending logs correctly.
If you see "Couldn't connect", check Loki's firewall/security settings.

## Querying Logs

```sh
count_over_time({job="applog"} |= "INFO" [5m])
count_over_time({job="applog"} |= "WARNING" [5m])
count_over_time({job="applog"} |= "ERROR" [5m])

count_over_time({logtype="application", filename="/opt/output.log"} |= "ERROR" [5m])
```

Example Results:
```
1860
17549

```