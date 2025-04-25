resource "helm_release" "minio" {
  provider = helm.vm2
  name     = "minio"
  chart    = "minio"
  repository = "https://charts.min.io/"
  namespace = "default"

  values = [file("${path.module}/../helm_values/minio.yaml")]
}