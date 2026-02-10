FROM grafana/grafana-enterprise:latest

USER root

# Copy custom provisioning configurations
COPY provisioning /etc/grafana/provisioning

# Copy custom dashboards (if any exist in repo structure, based on docker-compose volumes)
# Ensure the folder exists locally before build, or this might fail.
# The original compose mounted ./grafana/dashboards:/var/lib/grafana/dashboards
COPY dashboards /var/lib/grafana/dashboards

# Copy custom public assets (white-labeling/branding)
# The original compose mounted ./grafana/public:/usr/share/grafana/public
COPY public /usr/share/grafana/public

# Fix permissions for the grafana user
RUN chown -R grafana:grafana /etc/grafana/provisioning \
    && chown -R grafana:grafana /var/lib/grafana/dashboards \
    && chown -R grafana:grafana /usr/share/grafana/public

USER grafana
