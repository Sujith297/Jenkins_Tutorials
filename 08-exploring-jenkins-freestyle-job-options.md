## Objective

This tutorial explains important configuration options available in Jenkins Freestyle Jobs, including build retention, throttling, triggers, upstream/downstream projects, and build steps.

---

## Prerequisites

* Jenkins installed and running.
* A Freestyle Job already created.
* Basic understanding of Jenkins build execution.

---

## Freestyle Job Configuration

Open a Jenkins Freestyle Job and click **Configure**.

Several important options are available under the General and Build Triggers sections.

---

## 1. Restrict Where This Project Can Run

### Purpose

Run a job on a specific Jenkins agent (slave node).

### Configuration

Enable:

```text
Restrict where this project can be run
```

Specify the agent label:

```text
linux-agent
docker-agent
maven-agent
```

### Scenario

If a build requires Maven and Java, assign a label to the agent and configure the job to run only on that node.

---

## 2. Discard Old Builds

### Purpose

Automatically remove old build records and artifacts.

### Strategy

```text
Log Rotation
```

### When to Use

Long-running projects that generate many builds.

### Configuration Options

```text
Days to keep builds
Maximum number of builds to keep
Days to keep artifacts
Maximum number of artifacts to keep
```

### Interview Question

**Q:** If old builds are deleted, how can we restore a previous build?

**A:** Use backup solutions such as ThinBackup or external backup storage.

---

## 3. GitHub Project

### Purpose

Provides a reference link to the GitHub repository.

### Configuration

```text
Project URL:
https://github.com/username/project
```

### Benefit

Makes navigation between Jenkins and GitHub easier.

---

## 4. Throttle Builds

### Purpose

Control how frequently builds are executed.

### Use Case

Prevent excessive builds from consuming server resources.

### Example

```text
3 builds per minute
```

This means Jenkins schedules builds with approximately:

```text
20 seconds between builds
```

### Scenario

Rate limiting for frequently triggered projects.

---

## 5. Build Triggers

### Common Trigger Types

#### Poll SCM

```text
H/2 * * * *
```

Checks source code changes periodically.

---

#### Build Periodically

```text
0 9 * * *
```

Runs every day at 9:00 AM.

---

#### GitHub Webhook

Build starts immediately when code is pushed to GitHub.

---

## 6. Build After Other Projects Are Built

### Purpose

Create a CI/CD pipeline using multiple Freestyle Jobs.

### Example Flow

```text
DEV → TEST → UAT → PROD
```

### Terminology

#### Upstream Project

The project that triggers the current job.

Example:

```text
DEV triggers TEST
```

DEV is the upstream project.

---

#### Downstream Project

The project that is triggered by the current job.

Example:

```text
TEST triggers UAT
```

UAT is the downstream project.

---

### Configuration

```text
Projects to watch
```

Specify the upstream job name.

---

### Trigger Conditions

```text
Trigger only if build is stable
Trigger even if build is unstable
Trigger when build fails
```

### Scenario

```text
DEV Job
   ↓
TEST Job
   ↓
UAT Job
   ↓
PROD Job
```

Each stage automatically starts after the previous stage completes successfully.

---

## 7. Trigger Builds Remotely

### Purpose

Allow external systems to trigger Jenkins builds.

### Example

```text
Remote Trigger Token:
build-token
```

### Use Cases

* External automation tools
* Monitoring systems
* Custom applications
* Third-party integrations

---

## 8. Build Section

The Build section contains the actual commands executed by Jenkins.

### Execute Shell

Run Linux commands directly.

Example:

```bash
pwd
whoami
java -version
mvn clean package
```

### Common Uses

* Compile source code
* Run tests
* Package applications
* Execute deployment scripts

---

## Useful Plugin

### Build Pipeline Plugin

Provides a visual representation of upstream and downstream jobs.

### Installation

```text
Manage Jenkins
    → Plugins
    → Available Plugins
    → Build Pipeline
```

### Benefit

Visualizes the complete CI/CD flow from development to production.

---

## Summary

This tutorial covered:

* Running jobs on specific agents
* Discarding old builds
* GitHub project configuration
* Build throttling
* Build triggers
* Upstream and downstream projects
* Remote build triggering
* Execute Shell build steps
* Build Pipeline plugin

These features help create scalable and maintainable Jenkins Freestyle CI/CD pipelines.
