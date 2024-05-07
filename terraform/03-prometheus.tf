# resource "kubernetes_manifest" "this" {
#   provider = kubernetes
#   for_each = toset([
#     "../monitoring/prometheus-operator/*.yaml",
#     "../monitoring/prometheus/*.yaml",
#     "../monitoring/cadvisor/*.yaml",
#     "../monitoring/kube-state-metrics/*.yaml",
#   ])

#   manifest = provider::kubernetes::manifest_decode_multi(each.value)

# }
