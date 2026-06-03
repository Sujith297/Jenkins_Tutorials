# Installing Jenkins on an Amazon Linux EC2 Instance (c7i-flex.large)

### Prerequisites

Run all commands as the root user.

Command:

```bash
sudo -i
```

### Steps to Install Jenkins

1. Install Java (Jenkins runs on Java).

   Command:

   ```bash
   yum install java-21-amazon-corretto
   ```

   > Note: The Java version depends on the Jenkins version you are installing.

2. Go to the Jenkins website, open the download section, and select your operating system. In this case, choose **Red Hat Enterprise Linux and its derivatives** and follow the installation commands provided there.

   Link:
   https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos

3. Install Jenkins.

   Command:

   ```bash
   yum install jenkins
   ```

4. Check the Jenkins service status.

   Command:

   ```bash
   systemctl status jenkins
   ```

5. Start Jenkins.

   Command:

   ```bash
   systemctl start jenkins
   ```

## Configuring Jenkins

By default, Jenkins runs on port **8080**. Add port **8080** to the inbound rules of your EC2 instance's security group.

1. Open a browser and navigate to:

   ```text
   http://<ec2-public-ip>:8080
   ```

2. You will see the Jenkins setup page.

3. Jenkins will ask for the initial administrator password.

4. It will display the path where the password is stored. Copy the path and view the password using:

   ```bash
   cat <path-to-initial-admin-password>
   ```

5. Paste the password into the Jenkins setup page.

6. Create a username and password.

That's it. Jenkins is now ready to use.
