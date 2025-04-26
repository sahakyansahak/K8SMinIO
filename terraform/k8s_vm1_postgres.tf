resource "helm_release" "postgresql" {
  provider = helm.vm1

  name       = "postgresql"
  namespace  = "db"
  create_namespace = true

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "16.0.0"

  values = [
    file("../helm_values/postgres.yaml")
  ]
}