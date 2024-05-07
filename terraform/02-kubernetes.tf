provider "grafana" {
  # Configuration options
}
provider "helm" {
  kubernetes {
    config_path = pathexpand(kind_cluster.default.kubeconfig_path)
  }
}
provider "kubernetes" {
  host                   = kind_cluster.default.endpoint
  client_key             = base64decode(kind_cluster.default.client_key)
  client_certificate     = base64decode(kind_cluster.default.client_certificate)
  cluster_ca_certificate = base64decode(kind_cluster.default.cluster_ca_certificate)
}
