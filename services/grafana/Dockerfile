FROM grafana/grafana-enterprise:latest

USER root

# Copy custom provision configurations
COPY provisioning /etc/grafana/provisioning

# Copy custom dashboards
COPY dashboards /var/lib/grafana/dashboards

# Copy custom public assets
COPY public /usr/share/grafana/public

# Fix permissions for the grafana user
RUN chown -R grafana:grafana /etc/grafana/provisioning \
    && chown -R grafana:grafana /var/lib/grafana/dashboards \
    && chown -R grafana:grafana /usr/share/grafana/public

USER grafana
