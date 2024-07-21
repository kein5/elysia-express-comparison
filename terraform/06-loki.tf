resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki"
  version    = "5.41.5"
  namespace  = "monitoring"

  values     = [file("${path.module}/values/loki.yaml")]
  depends_on = [kubernetes_namespace.monitoring-namespace]
}
