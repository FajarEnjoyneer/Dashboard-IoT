FROM nodered/node-red:latest

# Copy package.json and install dependencies
COPY package.json /data/
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy flow definitions and settings
COPY flows.json /data/
COPY settings.js /data/

# Copy any static assets or csv files if needed
# COPY csv /data/csv
