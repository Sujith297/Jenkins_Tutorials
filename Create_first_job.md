Prerequisites

1. Install Git.
   Command:

   ```
   yum install git
   ```

Steps to Create a Manual Job for Build

1. Select the **Create Item** option.
2. Enter a name for the job, such as `project_name` or `service_name`.
3. Select the job type (**Pipeline**, **Freestyle**, or **Multibranch Pipeline**). Here, we select **Freestyle**.
4. Under **Source Code Management**, select **Git**.
5. Copy your repository HTTPS URL and paste it.
6. Specify the Git branch.
7. Save the job and build it.

Observe:

1. Console Output (location of the repository).
2. Workspace (check the files).

