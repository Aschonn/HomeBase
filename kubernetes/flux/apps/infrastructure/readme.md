# Infrastructure Folder

This folder contains all **cluster-level and platform services** required for the Kubernetes clusters.  
It is managed via **FluxCD** using Kustomizations and HelmReleases.

All resources in this folder are **prerequisites for workloads** and must be applied **before any applications are deployed**.

---

## Folder Structure

infrastructure/
├── ingress-nginx/ # HelmRelease + Kustomization for NGINX ingress controller
├── cert-manager/ # HelmRelease + Kustomization for TLS certificate management
├── storage/ # Storage classes, persistent volumes, and CSI drivers
├── csi-drivers/ # HelmReleases or manifests for CSI drivers
├── monitoring/ # Prometheus, Grafana, Alertmanager stack
├── logging/ # Loki, Promtail, and related logging components
├── backup/ # Velero or other backup solutions
├── security/ # SealedSecrets controller, Vault, RBAC, and cluster-wide secrets