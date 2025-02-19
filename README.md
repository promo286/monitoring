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

