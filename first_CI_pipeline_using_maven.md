# Building Our First CI Pipeline Using Maven for a Java Project

## Prerequisites for Maven

### Installation

Command:

```bash
yum install maven -y
```

## Maven Lifecycle

1. Code

   ```bash
   mvn archetype:generate
   ```

2. Compile

   ```bash
   mvn compile
   ```

3. Test

   ```bash
   mvn test
   ```

4. Package

   ```bash
   mvn package
   ```

5. Install

   ```bash
   mvn install
   ```

6. Clean

   ```bash
   mvn clean
   ```

## Setting Up Maven in Jenkins Using Tools

1. Go to **Manage Jenkins**.

2. Select **Tools**.

3. Navigate to the **Maven** section.

4. Provide a name for the Maven installation (for example, Maven and its version) and save it.

5. If Maven is already installed on the server (`yum install maven -y`), uncheck **Install automatically** and provide the Maven home path.

   Maven Home:

   ```text
   /usr/share/maven
   ```

6. Update the `pom.xml` file according to the required Java version (done by the developer).

## Creating the CI Job

Follow the same steps mentioned in the `Create_first_job.md` file.

1. After the **Build Triggers** section, go to the **Build** section.
2. Select **Invoke top-level Maven targets**.
3. Enter the goals:

   ```text
   clean install
   ```

## CD Pipeline

1. Create a new EC2 instance and install Tomcat using the `tomcat.sh` script. Read the script carefully for the username and password configuration.

2. Install the **Deploy to Container** plugin.

   Path:

   ```text
   Manage Jenkins → Plugins → Available Plugins
   ```

3. Configure the **Post-build Actions** section.

   <img width="1345" height="779" alt="image" src="https://github.com/user-attachments/assets/c1fddb8b-b231-4061-ab8e-e63ac79486b3" />

4. Open:

   ```text
   http://<ec2-public-ip>:8080
   ```

   Go to the **Manager App**, enter the username and password, and verify that the application has been deployed successfully.





   
