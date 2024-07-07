data "external" "monitoring_yaml_files" {
  # runs a bash script to get all yaml files in the monitoring directory
  program = [
    "bash",
    "${path.module}/scripts/get_yaml_files.sh",
    "${path.module}/../monitoring"
    ]

}

locals {
  yaml_files = data.external.monitoring_yaml_files.result # returns a list of file paths
  manifest_string = tostring(join("\n", [for f in local.yaml_files: file(f)])) # returns a string of all yaml files
}

resource "kubernetes_manifest" "monitoring" {
  depends_on = [
    helm_release.prometheus_operator_crds,
  ]
  for_each = local.yaml_files
  manifest = provider::kubernetes::manifest_decode(file(each.value))
  # manifest = provider::kubernetes::manifest_decode_multi(join("\n", toset(file(each.value))))

}
