FROM grafana/grafana-enterprise:latest

USER root

# Copy custom provision configurations
COPY --chown=grafana:grafana provisioning /etc/grafana/provisioning

# Copy custom dashboards
COPY --chown=grafana:grafana dashboards /etc/grafana/dashboards

# Copy custom public assets
COPY --chown=grafana:grafana public /usr/share/grafana/public

USER grafana
