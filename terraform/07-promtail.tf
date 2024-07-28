# resource "helm_release" "promtail" {
#   name       = "promtail"
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "promtail"
#   version    = "6.16.4"
#   namespace  = "monitoring"

#   values     = [file("${path.module}/values/promtail.yaml")]
#   depends_on = [kubernetes_namespace.monitoring-namespace]
# }
