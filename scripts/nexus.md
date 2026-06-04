# nexus.sh

This script installs Java, downloads and configures Nexus Repository Manager, creates a dedicated Nexus user, assigns the required permissions, starts the Nexus service, and displays the initial admin password.

```bash
#!/bin/bash

yum install java-21-amazon-corretto -y

cd /opt

wget https://download.sonatype.com/nexus/3/nexus-3.92.3-01-linux-x86_64.tar.gz

tar -zxvf nexus-3.92.3-01-linux-x86_64.tar.gz

useradd nexus

chown -R nexus:nexus nexus-3.92.3-01 sonatype-work

su - nexus

cd /opt/nexus-3.92.3-01/bin

./nexus start

./nexus status

cat /opt/sonatype-work/nexus3/admin.password
```

**Note:** Before running the script, verify the latest Nexus Repository Manager version from:

https://help.sonatype.com/en/download.html

Update the download URL and extracted folder name if a newer version is being used.

**Access Nexus UI:**

```text
http://<SERVER-IP>:8081
```

**Default Login:**

```text
Username: admin
Password: Check the output of:

cat /opt/sonatype-work/nexus3/admin.password
```

**Verify Nexus Status:**

```bash
cd /opt/nexus-3.92.3-01/bin

./nexus status
```

