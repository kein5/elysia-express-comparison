provider "grafana" {
  # Configuration options
}
provider "helm" {
  kubernetes {
    host = minikube_cluster.docker.host
    # client_certificate = minikube_cluster.docker.client_certificate
    # client_key = minikube_cluster.docker.client_key
    # cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
    config_path = "~/.kube/config"

  }
}
provider "kubernetes" {
  host                   = minikube_cluster.docker.host
  client_certificate     = minikube_cluster.docker.client_certificate
  client_key             = minikube_cluster.docker.client_key
  cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
}
