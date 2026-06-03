# Jenkins Triggers

In `Create_first_job.md` and `Create_second_job.md` (private repository), we built jobs manually.

To automate this process, we use **triggers**. Triggers can be configured in the **Build Triggers** section. We are going to learn three types of triggers:

1. Webhooks
2. Poll SCM
3. Build Periodically

## Using Webhooks

### Steps to be Done in GitHub

1. Go to the repository settings used in the first or second job.
2. Select **Webhooks**.
3. Add a webhook by providing the payload URL:

   ```text
   http://<jenkins-ip>:8080/github-webhook/
   ```

### Steps to be Done in Jenkins

4. Go to the job configuration.
5. Under **Build Triggers**, select **GitHub hook trigger for GITScm polling**.
6. Save the job.

### Observations

1. GitHub talks to Jenkins.
2. New commits automatically trigger the pipeline.

---

## Prerequisites

### Cron Syntax

Learn and practice:
https://crontab.guru/

### Linux Command

```bash
timedatectl set-timezone "Asia/Kolkata"
```

---

## Using Poll SCM

1. Go to the job configuration.
2. Under **Build Triggers**, select **Poll SCM**.
3. Add a cron expression.

   Example:

   ```text
   * * * * *
   ```

### Observations

1. Jenkins talks to GitHub and checks for new commits based on the configured schedule.
2. Verify the timezone on both the EC2 instance and Jenkins (**Manage Jenkins → Appearance → Time Zone**).
3. The pipeline is triggered only when new commits are detected.

---

## Using Build Periodically

1. Go to the job configuration.
2. Under **Build Triggers**, select **Build Periodically**.
3. Add a cron expression.

   Example:

   ```text
   * * * * *
   ```

### Observations

1. The job is triggered according to the configured schedule, regardless of whether new commits exist.




