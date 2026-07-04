# 10_Advanced_Declarative_Pipeline.md

In this tutorial, we will learn some advanced Declarative Pipeline concepts commonly used in real-world Jenkins projects.

Topics covered:

* Parallel Stages
* Environment Variables (Global and Local)
* Jenkins Global Environment Variables
* Script Block
* Using `if` Conditions
* Hybrid Pipelines (Declarative + Scripted)

---

# Parallel Stages

Parallel stages allow multiple tasks to run simultaneously, reducing the overall pipeline execution time.

Example:

```groovy
pipeline {

    agent any

    stages {

        stage('Parallel Execution') {

            parallel {

                stage('Build') {
                    steps {
                        echo 'Building...'
                    }
                }

                stage('Test') {
                    steps {
                        echo 'Testing...'
                    }
                }

                stage('Security Scan') {
                    steps {
                        echo 'Scanning...'
                    }
                }
            }
        }
    }
}
```

---

# Environment Variables

Environment variables are used to avoid hardcoding values inside the pipeline.

There are two types:

* Global Environment Variables
* Local Environment Variables

## Global Environment Variables

Declared at the pipeline level.

```groovy
pipeline {

    agent any

    environment {
        APP_NAME = "SpringBoot-App"
        ENV = "DEV"
    }

    stages {

        stage('Print') {
            steps {
                echo "${APP_NAME}"
                echo "${ENV}"
            }
        }
    }
}
```

These variables are accessible from every stage.

---

## Local Environment Variables

Declared inside a specific stage.

```groovy
stage('Build') {

    environment {
        VERSION = "1.0"
    }

    steps {
        echo "${VERSION}"
    }
}
```

These variables are available only within that stage.

---

# Creating Global Environment Variables in Jenkins

Instead of defining variables inside the Jenkinsfile, they can also be configured globally.

Steps:

1. Go to **Manage Jenkins**.
2. Select **System**.
3. Navigate to **Global Properties**.
4. Enable **Environment Variables**.
5. Add the required variables.
6. Save the configuration.

These variables can be accessed using:

```groovy
echo "${env.VARIABLE_NAME}"
```

---

# Script Block

The `script` block allows you to execute Groovy code inside a Declarative Pipeline.

```groovy
pipeline {

    agent any

    stages {

        stage('Script Block') {

            steps {

                script {

                    def project = "Jenkins"

                    echo project
                }
            }
        }
    }
}
```

---

# Using if Conditions

Conditional logic is generally written inside a `script` block.

Example:

```groovy
pipeline {

    agent any

    stages {

        stage('Deploy') {

            steps {

                script {

                    def environment = "dev"

                    if (environment == "dev") {
                        echo "Deploying to Development"
                    } else {
                        echo "Deploying to Production"
                    }

                }
            }
        }
    }
}
```

---

# Declarative vs Scripted Pipeline

## Declarative Pipeline

* Easy to read and maintain.
* Best suited for standard CI/CD workflows.
* Built-in syntax validation.
* Preferred for most Jenkins pipelines.

## Scripted Pipeline

* Written entirely in Groovy.
* Supports complex conditions, loops, and custom logic.
* More flexible but harder to read and maintain.

---

# Hybrid Pipeline (Recommended in Real-Time Projects)

In most real-world projects, teams use a **hybrid approach**.

* The overall pipeline is written using **Declarative Pipeline**.
* Complex business logic, loops, conditions, calculations, and dynamic behavior are written inside **`script {}`** blocks.

This approach provides the readability of Declarative Pipelines while leveraging the flexibility of Scripted Pipelines.

A typical pattern looks like:

```groovy
pipeline {

    agent any

    stages {

        stage('Build') {

            steps {

                script {

                    if (env.BRANCH_NAME == "main") {
                        echo "Production Build"
                    } else {
                        echo "Development Build"
                    }

                }

            }
        }
    }
}
```

**Note:** Declarative Pipelines are recommended for defining the overall pipeline structure, while `script {}` blocks should be used only when additional Groovy logic is required. This combination is the most common approach in enterprise CI/CD pipelines.
