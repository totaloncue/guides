# Overview of Github Actions

# GitHub Actions Overview

[Introduction by Github](https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/introduction-to-github-actions)

## What it is

1. Github-linked automation server/helper
1. Event-driven
   1. Events trigger workflows that are linked to a repo
   1. Workflows are comprised of jobs
   1. Jobs are comprised of steps that control order
   1. Each step contains actions to run
1. 2,000 minutes free per month of cloud run provided by Github
   1. Free for public repos!!!

## Concepts

1. Events -- specific activity that triggers workflows.
   1. Examples
      1. When someone pushes a commit to a specific branch of a repo
      1. When a pull request is created
   1. Webhooks can be used to trigger workflows based on external events
1. Workflows
   1. Automated procedure that is linked to a repository
   1. Comprised of one/more jobs and can be scheduled or triggered by events
   1. Defined using YAML syntax and stored in .github/workflows directory
1. Jobs
   1. Set of steps that are executed on the same 'runner'/machine
   1. Workflows with multiple jobs run them in parallel by default
1. Steps
   1. Individual task that can run actions
1. Actions
   1. Smallest building block
1. Runners
   1. Servers that have the Github Actions runner app installed
   1. Can be self-hosted
1. Expressions
   1. Expressions must use the syntax ${{ <expression> }} everywhere except in an 'if' conditional in a workflow (as it is already an expression)
      1. However, conditional if statements that use operators must still use the ${{<expression>}} syntax
1. Contexts
   1. Contexts allow access to information about workflow runs, runner environments, jobs and steps
   1. Use the syntax ${{ <context> }}
   1. Contexts vs default environment variables
      1. Default environment variables exist **only** on the runner executing job
      1. Contexts are available anywhere in the workflow, including outside of the runner used for execution
1. Environment Variables
   1. Default environment variables are available to every step in a workflow
   1. Custom environment variables can be set in the workflow file
      1. Can be specific to a step, job or entire workflow
         1. jobs.<job_id>.steps[*].env, jobs.<job_id>.env, env keywords
         1. When more than one environment variable is defined with the same name, GitHub uses the most specific environment variable

## Secrets

## Self-hosted runners

1. Currently the only option for ARM architectures as Github only supports x86 architectures on its own runners
1. This is much easier than it initially appears
1. [Github reference](https://docs.github.com/en/free-pro-team@latest/actions/hosting-your-own-runners)
1. Log files are kept in the \_diag folder
   1. Logs are quite large => prune regularly

### Setup on Linux ARM64

1. Download

```shell
// Create a folder
mkdir actions-runner && cd actions-runner
// Download the latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.274.2/actions-runner-linux-arm64-2.274.2.tar.gz
// Extract the installer
tar xzf ./actions-runner-linux-arm64-2.274.2.tar.gz
```

1. Configure

```shell
// Create the runner and start the configuration experience
./config.sh --url https://github.com/totaloncue/simple-express-server --token AAFNUJCO3XLJGTMOARXUBZK7ZIAYU
// Last step, run it!
./run.sh
```

1. Using your self-hosted runner

```yaml
runs-on: self-hosted
```

1. remove the runner

```shell
./config.sh remove --token AAFNUJH2YVMEICIXLER6UX27ZIDPY
```

### Setup as a service

[Reference](https://docs.github.com/en/actions/hosting-your-own-runners/configuring-the-self-hosted-runner-application-as-a-service)

Within the directory where the runner is installed:

1. Install the service

```shell
sudo ./svc.sh install
```

1. Start the service

```shell
sudo ./svc.sh start
```

1. Check service status

```shell
sudo ./svc.sh status
```

1. Stop service

```shell
sudo ./svc.sh stop
```

1. Uninstall the service

   First, stop the service, then:

```shell
sudo ./svc.sh uninstall
```

## F.A.Q.

1. Where do jobs run?
   1. When using Github hosted runners: each job runs in a fresh instance of a virtual environment specified by 'runs-on'
   1. When using self-hosted runners, runner is chosen based on labels provided
