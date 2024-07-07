locals {
  kubernetes_version = "v1.29.2"
}

terraform {
  required_version = ">=1.8.0"

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~>3.2.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~>2.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.31.0"
    }
  }
}
