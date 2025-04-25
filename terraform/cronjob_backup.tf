resource "kubernetes_cron_job" "pg_backup" {
  provider = kubernetes.vm1

  metadata {
    name = "pg-backup"
  }

  spec {
    schedule          = "0 2 * * *"
    job_template {
      spec {
        template {
          spec {
            container {
              name  = "backup"
              image = "postgres:16"
              command = ["/bin/sh", "-c", "sh /scripts/backup.sh"]
              volume_mount {
                name       = "script"
                mount_path = "/scripts"
              }
              env_from {
                secret_ref {
                  name = "pg-backup-secrets"
                }
              }
            }
            restart_policy = "OnFailure"

            volume {
              name = "script"
              config_map {
                name = kubernetes_config_map.backup_script.metadata[0].name
              }
            }
          }
        }
      }
    }
  }
}
