resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.24.1"
  namespace  = "monitoring"

#   values     = [file("${path.module}/values/prometheus.yaml")]
  depends_on = [kubernetes_namespace.monitoring]
}
