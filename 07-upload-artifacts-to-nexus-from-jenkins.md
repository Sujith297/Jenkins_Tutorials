## Objective

This tutorial explains how to create a Maven hosted repository in Nexus Repository Manager and configure Jenkins to upload build artifacts automatically after a successful build.

---

## Prerequisites

* Nexus Repository Manager is installed and running.
* Jenkins is installed and running.
* A Maven project is configured in Jenkins.
* The application generates a WAR file after the build.

---

## Step 1: Create a Maven Hosted Repository in Nexus

1. Log in to the Nexus web interface.
2. Navigate to **Settings** → **Repositories**.
3. Click **Create Repository**.
4. Select **maven2 (hosted)**.
5. Configure the repository:

   * Name: `myrepo`
   * Deployment Policy: `Allow Redeploy`
6. Click **Create Repository**.

---

## Step 2: Install the Nexus Artifact Uploader Plugin

1. Open Jenkins Dashboard.
2. Navigate to **Manage Jenkins** → **Plugins**.
3. Search for:

```text
Nexus Artifact Uploader
```

4. Install the plugin.
5. Restart Jenkins if required.

---

## Step 3: Configure Nexus Credentials in Jenkins

1. Navigate to **Manage Jenkins** → **Credentials**.
2. Click **Add Credentials**.
3. Select:

```text
Kind: Username with Password
```

4. Enter:

```text
Username: admin
Password: <nexus-password>
ID: nexus-creds
Description: Nexus Repository Credentials
```

5. Save the credentials.

---

## Step 4: Configure Artifact Upload in Jenkins Job

1. Open your Jenkins Job.
2. Click **Configure**.
3. Scroll to **Post-build Actions**.
4. Click **Add Post-build Action**.
5. Select **Nexus Artifact Uploader**.

---

## Step 5: Configure Nexus Artifact Uploader

### Nexus Configuration

```text
Nexus Version : Nexus 3
Protocol      : HTTP
Nexus URL     : <NEXUS-SERVER-IP>:8081
Credentials   : nexus-creds
Repository    : myrepo
```

### Maven Artifact Details

Retrieve the following values from the project's `pom.xml`.

```text
Group ID    : <groupId>
Artifact ID : <artifactId>
Version     : <version>
```

### Artifact Configuration

```text
Artifact ID : <artifactId>
Type        : war
File        : target/<artifactId>-<version>.war
```

Example:

```text
Artifact ID : srtifsct
Type        : war
File        : target/srtifsct-1.0.war
```

---

## Step 6: Build the Job

1. Click **Save**.
2. Click **Build Now**.
3. Wait for the build to complete successfully.

---

## Step 7: Verify the Artifact in Nexus

1. Log in to Nexus Repository Manager.
2. Open the `myrepo` repository.
3. Verify that the WAR file has been uploaded successfully.

---

## Expected Result

After a successful Jenkins build, the generated WAR file is automatically uploaded to the Nexus Maven hosted repository and is available for deployment or distribution.
