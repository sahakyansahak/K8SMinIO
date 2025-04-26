resource "helm_release" "minio" {
  provider = helm.vm2

  name       = "minio"
  namespace  = "storage"
  create_namespace = true

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "minio"
  version    = "12.6.3"

  values = [
    file("../helm_values/minio.yaml")
  ]

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "service.port"
    value = "9000"
  }
}