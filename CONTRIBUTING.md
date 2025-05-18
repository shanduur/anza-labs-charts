# Contributing to anza-labs-charts

**Table of Contents**

- [Contributing to anza-labs-charts](#contributing-to-anza-labs-charts)
  - [Issues](#issues)
    - [Reporting an Issue](#reporting-an-issue)
    - [Issue Lifecycle](#issue-lifecycle)
  - [Pull Requests](#pull-requests)
  - [Developing](#developing)
    - [Development Environment](#development-environment)
    - [Chart Standards](#chart-standards)
    - [Linting and Testing](#linting-and-testing)
  - [Documentation](#documentation)
  - [Releasing](#releasing)
    - [Versioning](#versioning)
    - [Publishing](#publishing)
  - [Afterword](#afterword)

**First:** if you're unsure or hesitant about anything, just ask or open an issue or pull request anyway. The worst that can happen is you'll be kindly asked to make changes. All good-faith contributions are welcome!

## Issues

### Reporting an Issue

* Use the latest chart version before reporting a bug.
* Include as much detail as possible:
  * Chart name and version
  * Helm version
  * Configuration used
  * Error logs and `--debug` output
* Avoid including sensitive information. Share crash logs or command output via [Gist](https://gist.github.com) when appropriate.

### Issue Lifecycle

1. Issue is created.
2. A maintainer triages and labels it.
3. Community members may pick it up and submit a fix.
4. A pull request references and resolves the issue.
5. The issue is closed once the fix is merged.

## Pull Requests

All contributions should be submitted as pull requests from a fork, regardless of your permissions.

Before submitting a PR:

* Bump the chart version in `Chart.yaml` (follow SemVer).
* Update `README.md.gotpl` if you modify values or templates.
* Run `make all` to lint, template, and regenerate documentation.

## Developing

### Development Environment

You’ll need the following tools:

* [Helm 3](https://helm.sh/)
* [GNU Make](https://www.gnu.org/software/make/)
* [Docker](https://www.docker.com/) (optional, depending on your workflow)

Clone the repository:

```sh
git clone https://github.com/anza-labs/anza-labs-charts.git
cd anza-labs-charts
```

Run the default development workflow:

```sh
make all
```

This command will:

* Lint all charts
* Render Helm templates
* Regenerate README files

If `make all` fails, fix any issues before submitting a PR.

### Chart Standards

Charts are located under `charts/`. Each chart should:

* Follow [Helm Best Practices](https://helm.sh/docs/chart_best_practices/).
* Contain a complete and descriptive `Chart.yaml`.
* Include a `values.yaml` with documented, sane defaults.

Deprecated charts must be clearly marked in both their `Chart.yaml` and rendered `README.md`.

### Linting and Testing

All linting, testing, and README generation is handled by:

```sh
make all
```

Use this target to validate your changes before creating a PR.

To test a chart locally:

```sh
helm install --dry-run --debug my-chart charts/my-chart
```

> [!NOTE]
> We intend to introduce [helm-unittest](https://github.com/helm-unittest/helm-unittest) as the standard framework for writing unit tests for Helm charts.
> For details or to track progress, see [FEATURE: Add unit tests to all charts using helm-unittest](https://github.com/anza-labs/charts/issues/37).
> Contributions that include or help enable these tests are very welcome!

## Documentation

Chart documentation is automatically generated.

To regenerate all READMEs:

```sh
make all
```

Document every configurable value in `values.yaml`. Keep the README current with the latest chart capabilities.

## Releasing

Maintainers are responsible for cutting releases, but contributors should prepare changes for release.

### Versioning

All charts follow [Semantic Versioning](https://semver.org/). Bump the version in `Chart.yaml`:

* Patch (`x.y.Z`) — Bug fix
* Minor (`x.Y.z`) — New feature
* Major (`X.y.z`) — Breaking change

### Publishing

Once merged into `main`, the CI pipeline will handle packaging and publishing the charts to Artifact Hub or the relevant Helm repository.

## Afterword

This guide is here to help you contribute effectively and with confidence. If anything is unclear or outdated, please open an issue or a PR.

Welcome aboard — and thank you for helping improve the Anza Labs charts! 🚀
