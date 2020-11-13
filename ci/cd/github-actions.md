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

## Secrets
