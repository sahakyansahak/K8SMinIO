resource "kubernetes_secret" "backup_secrets" {
  provider = kubernetes.vm1
  metadata {
    name = "pg-backup-secrets"
  }

  data = {
    POSTGRES_PASSWORD = "supersecure"
    S3_ENDPOINT       = "base64-encoded-endpoint"
    S3_ACCESS_KEY     = "0r3arCGXLkaYFWn/FyPyMdI8WvREstGbzGzMKh37"
    S3_SECRET_KEY     = "0r3arCGXLkaYFWn/FyPyMdI8WvREstGbzGzMKh37"
  }

  type = "Opaque"
}