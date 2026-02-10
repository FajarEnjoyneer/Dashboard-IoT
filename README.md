# Dashboard-IIOT

A comprehensive Industrial IoT Dashboard solution featuring data visualization (Grafana), flow-based programming (Node-RED), time-series database (InfluxDB), and MQTT messaging (Mosquitto).

## Overview

This project provides a complete stack for monitoring and analyzing industrial data:
- **Node-RED**: For data acquisition, processing, and flow management.
- **InfluxDB**: High-performance time-series database for storing sensor data.
- **Grafana**: For visualizing data and creating monitoring dashboards.
- **Mosquitto**: MQTT broker for lightweight M2M communication.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/Dashboard-IIOT.git
   cd Dashboard-IIOT
   ```

2. **Start the services:**
   ```bash
   docker-compose up -d
   ```

3. **Access the services:**
   - **Node-RED**: [http://localhost:1880](http://localhost:1880)
   - **Grafana**: [http://localhost:3000](http://localhost:3000) (Default login: `admin` / `admin`)
   - **InfluxDB**: [http://localhost:8086](http://localhost:8086)

## Project Structure

```
├── docker-compose.yml   # Orchestration of all services
├── .gitignore           # Git ignore rules
├── grafana/             # Grafana configuration and data
├── influxdb/            # InfluxDB data
├── mosquitto/           # Mosquitto config and logs
└── nodered/             # Node-RED flows and settings
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request# Dashboard-IoT
