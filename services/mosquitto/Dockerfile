FROM eclipse-mosquitto:latest

# Copy configuration
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Set permissions
USER root
RUN chown mosquitto:mosquitto /mosquitto/config/mosquitto.conf
USER mosquitto
