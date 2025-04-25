resource "kubernetes_config_map" "backup_script" {
  provider = kubernetes.vm1
  metadata {
    name = "backup-script"
  }

  data = {
    "backup.sh" = file("${path.module}/../scripts/backup.sh")
  }
}