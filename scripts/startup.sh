#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

echo "<html><body><h1>HELLO WORLD from $(hostname)</h1></body></html>" > /var/www/html/index.html