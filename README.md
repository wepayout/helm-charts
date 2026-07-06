# Helm Charts — WePayOut

A repository of generic, reusable [Helm](https://helm.sh/) charts maintained by
WePayOut, used to standardize application deployments on Kubernetes.

Charts are published automatically to
[GitHub Pages](https://wepayout.github.io/helm-charts) on every push to the
`main` branch, using the
[chart-releaser-action](https://github.com/helm/chart-releaser-action).

## Available charts

| Chart | Version | Description |
|-------|---------|-------------|
| [`deployment`](charts/deployment) | `0.2.50` | Generic application Deployment with Istio service mesh support, autoscaling (KEDA), SLOs, PodDisruptionBudget, and more. |
| [`cronjob`](charts/cronjob) | `0.1.19` | Generic CronJob with Istio service mesh support and extensive customization through `values`. |
| [`provisioner`](charts/provisioner) | `0.1.8` | [Karpenter](https://karpenter.sh/) Provisioner for dynamic node provisioning in the cluster. |
| [`argocd-apps`](charts/argocd-apps) | `0.1.0` | Declarative management of [ArgoCD](https://argo-cd.readthedocs.io/) `Application` resources. |

## Usage

### 1. Add the repository

```bash
helm repo add wepayout https://wepayout.github.io/helm-charts
helm repo update
```

### 2. Install a chart

```bash
helm install ${release_name} wepayout/${chart_name}
```

For example, to install the `deployment` chart:

```bash
helm install my-app wepayout/deployment -f values.yaml
```

Each chart has its own set of customizable values. Refer to the chart's
`values.yaml` and `README.md` for details:

- [`charts/deployment`](charts/deployment)
- [`charts/cronjob`](charts/cronjob)
- [`charts/provisioner`](charts/provisioner)
- [`charts/argocd-apps`](charts/argocd-apps)

## Repository structure

```
.
├── charts/
│   ├── deployment/     # Generic Deployment + Istio
│   ├── cronjob/        # Generic CronJob + Istio
│   ├── provisioner/    # Karpenter Provisioner
│   └── argocd-apps/    # ArgoCD Applications
└── .github/
    └── workflows/
        └── release.yaml  # Automatic chart publishing
```

## Versioning and releases

- Charts follow [Semantic Versioning](https://semver.org/).
- **Always** bump the `version` field in a chart's `Chart.yaml` whenever the
  chart changes. The `chart-releaser-action` only publishes a new release when
  the version changes.
- Releases happen automatically when changes are merged into the `main` branch:
  the workflow packages the updated charts and publishes the artifacts to
  GitHub Pages.

## Contributing

1. Create a feature branch off `main`.
2. Make your changes in the target chart.
3. Bump the `version` in the chart's `Chart.yaml`.
4. Validate the templates locally before opening the PR:
   ```bash
   helm template test ./charts/${chart_name} -f values.yaml
   helm lint ./charts/${chart_name}
   ```
5. Open a Pull Request against `main`.
