resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.2.3"
  cleanup_on_fail  = true
  namespace        = "ingress-nginx"
  create_namespace = true

  values     = [file("${path.module}/values/ingress-nginx.yaml")]
  depends_on = [kubernetes_namespace.ingress_nginx]
}
