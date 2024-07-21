resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "8.3.6"
  namespace  = "monitoring"

  values     = [file("${path.module}/values/grafana.yaml")]
  depends_on = [kubernetes_namespace.monitoring-namespace]
}

