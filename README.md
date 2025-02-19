# monitoring

## What is Prometheus?

Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. It collects and stores its metrics as time series data, i.e., metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.

## What is Grafana?

Grafana is an open-source platform for monitoring and observability. It allows you to query, visualize, alert on, and understand your metrics no matter where they are stored. It provides you with tools to turn your time-series database (TSDB) data into insightful graphs and visualizations.

## Architecture

### Prometheus Architecture

Prometheus architecture consists of multiple components:

- **Prometheus Server**: Scrapes and stores time series data.
- **Client Libraries**: Used to instrument application code.
- **Push Gateway**: For short-lived jobs.
- **Exporters**: For services like HAProxy, StatsD, Graphite, etc.
- **Alertmanager**: Handles alerts.
- **Web UI**: Allows you to query data and visualize it.

### Grafana Architecture

Grafana architecture includes:

- **Data Source**: Connects to various data sources like Prometheus, InfluxDB, Elasticsearch, etc.
- **Backend**: Handles authentication, data source queries, and alerting.
- **Frontend**: Provides the user interface for creating and viewing dashboards.
- **Plugins**: Extend Grafana's functionality.

## Examples

### Prometheus Example

1. **Install Prometheus**: Follow the [Prometheus installation guide](https://prometheus.io/docs/prometheus/latest/installation/).
2. **Configure Prometheus**: Add a job to `prometheus.yml` to scrape metrics from your application.
    ```yaml
    scrape_configs:
      - job_name: 'example'
        static_configs:
          - targets: ['localhost:9090']
    ```
3. **Run Prometheus**: Start Prometheus with the configured `prometheus.yml`.

### Grafana Example

1. **Install Grafana**: Follow the [Grafana installation guide](https://grafana.com/docs/grafana/latest/installation/).
2. **Add Data Source**: Configure Prometheus as a data source in Grafana.
3. **Create Dashboard**: Use Grafana's UI to create a new dashboard and add panels to visualize your metrics.

For more detailed examples and configurations, refer to the official documentation of [Prometheus](https://prometheus.io/docs/introduction/overview/) and [Grafana](https://grafana.com/docs/grafana/latest/getting-started/).
