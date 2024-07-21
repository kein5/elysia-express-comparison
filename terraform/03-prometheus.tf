# data "external" "monitoring_yaml_files" {
#   # runs a bash script to get all yaml files in the monitoring directory
#   program = [
#     "bash",
#     "${path.module}/scripts/get_yaml_files.sh",
#     "${path.module}/../monitoring"
#     ]
# }

# locals {
#   yaml_files = data.external.monitoring_yaml_files.result # returns a list of file paths
# }

# resource "kubernetes_manifest" "monitoring" {
#   # cadvisor for monitoring node-level metrics.
#   # grafana for hosting monitoring UI which receives metrics from prometheus.
#   # kube-state-metrics for observing kubernetes objects.
#   # prometheus for collecting various metrics.
#   # prometheus-operator for automating management of prometheus.
#   depends_on = [
#     helm_release.prometheus_operator_crds,
#   ]

#   for_each = local.yaml_files
#   manifest = provider::kubernetes::manifest_decode(file(each.value))
# }

# Helm chart for Prometheus
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.24.1"
  namespace  = "monitoring"

#   values     = [file("${path.module}/values/prometheus.yaml")]
  depends_on = [kubernetes_namespace.monitoring-namespace]
}
