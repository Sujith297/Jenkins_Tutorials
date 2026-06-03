# Jenkins Master-Slave Concept

The Master-Slave architecture is used to distribute pipeline execution across different environments such as Dev, Test, UAT, and Production, or across different services.

The Jenkins Master manages and distributes jobs to the configured Slave nodes.

## Setup

### Master Node

* Jenkins should be installed on the master instance.
* Git installation is not required on the master if builds are executed on slave nodes.

### Slave Nodes

* Java must be installed.
* Git must be installed.
* Any additional tools required for the build process should also be installed.

## Adding a New Slave Node

1. Go to **Manage Jenkins → Nodes**.

2. Click **New Node**.

3. Enter a node name.

4. Select **Permanent Agent** and create the node.

5. Provide a label such as `dev`, `test`, `uat`, or `prod`.

6. Under **Usage**, select **Only build jobs with label expressions matching this node**.

7. Under **Launch Method**, select **Launch agents via SSH**.

8. Provide:

   * Hostname (Private IP of the slave instance)
   * Credentials
   * Username (EC2 username)
   * Private key (contents of the `.pem` file)

9. Save the configuration and verify that the node connects successfully.

## Running Jobs on a Specific Node

1. Open the job configuration.
2. Select **Restrict where this project can be run**.
3. Enter the node label (for example, `dev`, `test`, or `prod`).
4. Save the job.

The CI/CD pipeline will now run on the selected slave node instead of the master node.

