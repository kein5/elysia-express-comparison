resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = "minikube"
  addons       = [
    "default-storageclass",
    "storage-provisioner",
    "ingress",
    "dashboard",
  ]

}
