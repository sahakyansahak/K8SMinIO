resource "helm_release" "postgres" {
  provider = helm.vm1
  name     = "postgres"
  chart    = "bitnami/postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "default"

  values = [file("${path.module}/../helm_values/postgres.yaml")]
}
