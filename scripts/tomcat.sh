# tomcat.sh

This script installs Java, downloads and configures Apache Tomcat, creates a Tomcat manager user, removes the default manager access restrictions, and starts the Tomcat server.

```bash
#!/bin/bash

yum install java-17-amazon-corretto -y

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.117/bin/apache-tomcat-9.0.117.tar.gz

tar -zxvf apache-tomcat-9.0.117.tar.gz

sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.117/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.117/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="admin@123" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.117/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.117/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.117/conf/tomcat-users.xml

sed -i '21d' apache-tomcat-9.0.117/webapps/manager/META-INF/context.xml
sed -i '22d' apache-tomcat-9.0.117/webapps/manager/META-INF/context.xml

sh apache-tomcat-9.0.117/bin/startup.sh
```

**Note:** Before running the script, verify the Tomcat version from:

```text
https://dlcdn.apache.org/tomcat/
```

and update the download URL and folder name if a newer version is being used.

