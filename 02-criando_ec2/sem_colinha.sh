#!/bin/bash

# Ubuntu Universe
sudo apt update
sudo apt install -y docker.io
sudo tee -a /etc/init.d/custom_startup > /dev/null <<EOT
#!/bin/sh -
# Custom startup of applications
#
### BEGIN INIT INFO
# Provides: Custom startup of applications
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Required-Start: $network $remote_fs
# Required-Stop: $remote_fs $network
# Short-Description: That's  all folks
# Description: That's  all folks
### END INIT INFO
EOT
sudo chmod 755 /etc/init.d/custom_startup
sudo update-rc.d custom_startup defaults
sudo systemctl enable custom_startup