#!/bin/bash

# Nexus Repository Manager Installation

# Install Java
sudo yum install java-21-amazon-corretto -y

# Move to /opt directory
cd /opt

# Download Nexus Repository Manager
sudo wget https://download.sonatype.com/nexus/3/nexus-3.92.3-01-linux-x86_64.tar.gz

# Extract Nexus package
sudo tar -zxvf nexus-3.92.3-01-linux-x86_64.tar.gz

# Create nexus user
sudo useradd nexus

# Change ownership
sudo chown -R nexus:nexus nexus-3.92.3-01 sonatype-work

# Switch to nexus user
sudo su - nexus

# Navigate to Nexus bin directory
cd /opt/nexus-3.92.3-01/bin

# Start Nexus
./nexus start

# Check Nexus status
./nexus status

# Display initial admin password
cat /opt/sonatype-work/nexus3/admin.password
