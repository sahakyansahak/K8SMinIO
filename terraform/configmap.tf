resource "kubernetes_config_map" "backup_script" {
  provider = kubernetes.vm1
  metadata {
    name = "backup-script"
    namespace = "db"
  }

  data = {
    "backup.sh" = file("${path.module}/../scripts/backup.sh")
  }
}
resource "kubernetes_config_map" "mirror_script" {
  provider = kubernetes.vm2
  metadata {
    name = "mirror-script"
    namespace = "storage"
  }

  data = {
    "mirror.sh" = file("${path.module}/../scripts/mirror.sh")
  }
}