# Install manually
# helm repo add grafana https://grafana.github.io/helm-charts
# helm repo update
# helm install tempo --namespace monitoring --create-namespace --version 1.6.2 --values terraform/values/tempo.yaml grafana/tempo
resource "helm_release" "tempo" {
  name = "tempo"

  repository       = "https://grafana.github.io/helm-charts"
  chart            = "tempo"
  namespace        = "monitoring"
  version          = "1.10.1"
  create_namespace = true

  values = [file("${path.module}/values/tempo.yaml")]
  depends_on = [kubernetes_namespace.monitoring-namespace]
}
