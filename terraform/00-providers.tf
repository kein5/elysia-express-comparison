locals {
  kubernetes_version = "v1.29.2"
}
terraform {
  required_version = ">=1.8.0"

  required_providers {
    # kind = {
    #   source = "tehcyx/kind"
    #   version = "~>0.4.0"
    # }
    minikube = {
      source = "scott-the-programmer/minikube"
      version = "~>0.3.10"
    }
    grafana = {
      source = "grafana/grafana"
      version = "~>2.18.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~>2.13.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~>2.29.0"
    }
  }
}

provider "minikube" {
  kubernetes_version = local.kubernetes_version
}
