#!/bin/bash

# Check if httpd is installed
if ! command -v httpd &>/dev/null; then
    echo "Apache HTTP Server (httpd) is not installed."
else
    # Stop the httpd service
    sudo systemctl stop httpd

    # Disable httpd from starting at boot
    sudo systemctl disable httpd

    # Remove httpd package
    sudo yum remove httpd -y

    # Remove configuration files
    sudo rm -rf /etc/httpd

    # Remove log files
    sudo rm -rf /var/log/httpd

    echo "Apache HTTP Server (httpd) has been stopped, disabled, removed, and all associated files and configurations have been deleted."
fi


