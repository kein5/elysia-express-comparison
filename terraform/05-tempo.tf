resource "helm_release" "tempo" {
  name = "tempo"

  repository       = "https://grafana.github.io/helm-charts"
  chart            = "tempo"
  namespace        = "monitoring"
  version          = "1.10.1"

  values = [file("${path.module}/values/tempo.yaml")]
  depends_on = [kubernetes_namespace.monitoring]
}
