#!/bin/sh
set -e

apk add --no-cache curl jq

# tunggu grafana
until curl -sSf "$GRAFANA_URL/api/health" > /dev/null 2>&1; do
  echo "waiting grafana..."; sleep 2;
done
echo "grafana ready"

# tunggu datasource
ds_name="$TARGET_DS"
until curl -s -u "$GF_ADMIN_USER:$GF_ADMIN_PASSWORD" "$GRAFANA_URL/api/datasources/name/$ds_name" > /dev/null 2>&1; do
  echo "waiting datasource $ds_name..."; sleep 2;
done
echo "datasource $ds_name ready"

# proses file JSON
for f in /uploads/*.json; do
  [ -f "$f" ] || continue
  base=$(basename "$f")
  echo "processing $base"

  jq --arg TARGET "$ds_name" '
    def walk(f):
      . as $in
      | if type == "object" then
          reduce keys[] as $key ({}; . + { ($key): ($in[$key] | walk(f)) }) | f
        elif type == "array" then map(walk(f)) | f
        else f
      end;
    walk(
      if type=="object" and has("datasource") then
        .datasource = (
          if (.datasource|type) == "object" then $TARGET
          elif (.datasource|type) == "string" and ((.datasource|ascii_downcase) | test("grafana")) then $TARGET
          else .datasource end
        )
      else . end
    ) | del(.id, .version)
  ' "$f" > "/dashboards/$base"

  payload=$(jq -c '{dashboard: ., overwrite: false}' "/dashboards/$base")
  http_code=$(curl -s -o /tmp/resp -w "%{http_code}" \
    -u "$GF_ADMIN_USER:$GF_ADMIN_PASSWORD" \
    -H "Content-Type: application/json" \
    -X POST "$GRAFANA_URL/api/dashboards/db" \
    -d "$payload")

  echo "imported $base -> HTTP $http_code"
  cat /tmp/resp || true
  echo ""
done

echo "all imports done"
