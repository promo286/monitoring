## Run this on your Loki server:

```sh
curl -G "http://localhost:3100/loki/api/v1/query_range" \
--data-urlencode 'query={job="varlogs"}' \
--data-urlencode 'start=2025-02-25T00:00:00Z' \
--data-urlencode 'end=2025-02-25T23:59:59Z' \
--data-urlencode 'limit=50'
```

## Run this on your Promtail server:

```sh
curl -G "http://localhost:3100/loki/api/v1/labels"
```

## Test Logs:

```sh
echo '{"streams": [{ "stream": { "job": "test-log" }, "values": [ [ "'$(date +%s%N)'", "Hello from Loki!" ] ] }]}' \
| curl -X POST -H "Content-Type: application/json" -s "http://localhost:3100/loki/api/v1/push" -d @-

```