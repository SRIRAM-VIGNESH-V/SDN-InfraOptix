# Dowanload the appropriate package.
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.9_amd64.deb

# Install it.
sudo dpkg -i influxdb_1.7.9_amd64.deb

# Install InfluxDB's Python library. The SVM classifier uses it!
sudo apt-get update && apt-get install -yq python3-influxdb

# Start InfluxDB.
sudo systemctl start influxd

# And remove the uneeded package.
rm influxdb_1.7.9_amd64.deb
