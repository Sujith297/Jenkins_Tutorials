# jenkins.sh

This script installs Java, adds the Jenkins repository, installs Jenkins, enables the Jenkins service, and starts Jenkins.

```bash
#!/bin/bash

yum install java-21-amazon-corretto -y

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install jenkins -y

systemctl enable jenkins

systemctl start jenkins

systemctl status jenkins
```

## Accessing Jenkins

Open the following URL in your browser:

```text
http://<ec2-public-ip>:8080
```

## Getting the Initial Administrator Password

```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy the password and paste it into the Jenkins setup page.

## Note

The Jenkins installation steps may change over time. Before updating this script, verify the latest installation commands from:

```text
https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos
```
