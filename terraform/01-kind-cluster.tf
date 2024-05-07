resource "kind_cluster" "default" {
  name            = "test-cluster"
  node_image      = "kindest/node:v1.29.2"
  kubeconfig_path = pathexpand("${path.module}/config")
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    # control-plane
    node {
      role = "control-plane"
      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }
    
    # worker
    node {
      role = "worker"
    }
  }
}
