# Repository Builder

`repo-builder.sh` creates a local project directory and a corresponding public
GitHub repository, then scaffolds a starter application for the selected
language/stack.

## Requirements

- Bash
- [GitHub CLI](https://cli.github.com/) (`gh`), installed and authenticated with
  permission to create public repositories
- Tools for the selected stack:
  - **Laravel:** PHP, Composer, Node.js, and npm
  - **React:** Node.js and npm
  - **Go:** Go
  - **Python:** Python 3

The relevant package managers and project generators may download dependencies
from the internet.

## Usage

From the directory containing `repo-builder.sh`, run:

```bash
./repo-builder.sh <repo_name> <language>
```

`repo_name` is used as the new directory and GitHub repository name.
`language` must be one of:

| Language | Generated structure |
| --- | --- |
| `laravel` | Laravel API in `api/` and a Next.js TypeScript/Tailwind app in `web/`; installs Laravel API support and Axios |
| `react` | Vite React TypeScript app in `web/` and an Express/CORS Node.js project in `api/`; installs Axios and React Router in `web/` |
| `go` | Go module and `main.go` |
| `python` | Python virtual environment and `app.py` |

For example:

```bash
./repo-builder.sh my-app react
```

The script creates a public GitHub repository named `my-app` and configures it
as the `origin` remote. It runs `gh repo create` before scaffolding the selected
stack, so the GitHub CLI must be ready before starting.

## Installing the command

`migrate.sh` makes `repo-builder.sh` executable and copies it to
`/usr/local/bin/` using `sudo`, allowing it to be run as `repo-builder.sh`
outside the project directory while keeping the original in place:

```bash
./migrate.sh
repo-builder.sh my-app react
```

Run `migrate.sh` from the directory containing `repo-builder.sh`.

## Notes

- The GitHub repository is always created as **public**.
- Choose a valid language before running: the script creates the GitHub
  repository before checking whether the language is supported.
- The Go and Python branches create a second directory with the repository
  name inside the first one; their generated files are therefore nested one
  level below the top-level repository directory.
