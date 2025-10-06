# DeveloperEnvironment

DeveloperEnvironment is a comprehensive repository containing a collection of useful scripts and configuration files designed to streamline development workflows across multiple programming languages and tools. This repository supports various languages including Python, PowerShell, C, C++, and Bash, providing essential resources to enhance productivity and efficiency for developers.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Linting Jobs](#linting-jobs)
- [Contributing](#contributing)
- [License](#license)

## Features

The DeveloperEnvironment repository offers:

- Python Scripts: Utilities and tools to automate and simplify Python development tasks.
- PowerShell Scripts: Handy scripts for Windows environment management and automation.
- C/C++ Resources: Compilation scripts and useful code snippets to aid in C and C++ development.
- Bash Scripts: Shell scripts for Unix/Linux environments to automate routine tasks and improve workflow efficiency.

Whether you are working on a personal project or a professional development environment, this repository aims to provide valuable tools and scripts to support and enhance your coding experience across different platforms and languages.

## Usage

Each file can be executed independently using its specific build tools and environments.

## Linting Jobs

Linting improves code quality, readability, and maintainability by enforcing consistent coding standards, detecting errors early, and automating style checks.

Linting jobs are executed for every pull request or merge into the main branch. The particular job that runs will be determined by the directory targeted by the pull request. 

[![PowerShell](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/powershell.yml/badge.svg)](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/powershell.yml)
[![Bash](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/bash.yml/badge.svg)](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/bash.yml)
[![TruffleHog](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/trufflehog.yml/badge.svg)](https://github.com/Jordanmarshall2510/DeveloperEnvironment/actions/workflows/trufflehog.yml)

## Contributing

**Add files:**
    <br /> `git add <file 1> <file 2>`
    <br />  or
    <br /> `git add -u`

**Commit your changes:**
    <br /> `git commit -s` (Initial)
    <br /> `git commit --no-edit --amend` (Amending)

**Push to branch:**
    <br /> `git push -u origin HEAD` (Initial)
    <br /> `git commit --force-with-lease origin HEAD` (Amending)

Commit messages must contain detail of changes made and must follow this template:

```
<Title of commit>

- <Change 1>
- <Change 2>

Signed-off-by: <First Name> <LastName> <email@sample.com>
```

## License

Distributed under the MIT License. See LICENSE for more information.