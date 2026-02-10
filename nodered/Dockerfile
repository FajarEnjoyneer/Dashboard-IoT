FROM nodered/node-red:latest

# Copy package.json and install dependencies
COPY data/package.json /data/
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy flow definitions and settings
# This makes the image immutable with the current logic
COPY data/flows.json /data/
COPY data/settings.js /data/

# Copy any static assets or csv files if needed
COPY data/csv /data/csv
