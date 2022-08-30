# Contributing Guide

Contributing to `assemble-local-dev` is very easy. This document shows you how to
get the project, run it locally, and submit a pull request.

## Getting Started

To get started, follow the instructions from [README.md](./README.md). You will be able to get the source code and run the docker-compose.yml file. Once everything is up and running, you can start contributing.  

## Contributing / Submitting changes

Before starting contributing, make sure there is a GitHub issue created and approved.

- Check out a new `feature` branch from the `main` branch and name it with the issue number and what you intend to do:
    - Example:
      ````
      $ git checkout -b BRANCH_NAME origin/main
      ````
      If you get an error, you may need to fetch `main` first by using
      ````
      $ git remote update && git fetch
      ````
    - Use one branch per fix/feature
- Make your changes
    - Make sure that everything is running fine.
- Commit your changes
    - Please provide a git message that explains what you've done.
    - Commit to the repository.
- Make a pull request
    - Make sure you send the PR to the `main` branch.
    - Smaller PR are easier & safer to review. They are greatly appreciated.

If you follow these instructions, your PR will land pretty safely in the `main` branch!

Thanks for contributing!