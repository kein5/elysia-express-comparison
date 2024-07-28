data "external" "grafana_yaml_files" {
  # runs a bash script to get all yaml files in the monitoring directory
  program = [
    "bash",
    "${path.module}/scripts/get_yaml_files.sh",
    "${path.module}/../grafana"
    ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "8.3.6"
  namespace  = "monitoring"

  values     = [file("${path.module}/values/grafana.yaml")]
  depends_on = [kubernetes_namespace.monitoring]
}

resource "kubernetes_manifest" "ingress-grafana" {
  for_each = data.external.grafana_yaml_files.result
  manifest = provider::kubernetes::manifest_decode(file(each.value))
}
