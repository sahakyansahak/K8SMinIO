resource "kubernetes_cron_job_v1" "demo" {
    provider = kubernetes.vm1
  metadata {
    name = "demo"
    namespace = "db"
  }
  spec {
    concurrency_policy            = "Replace"
    failed_jobs_history_limit     = 5
    schedule                      = "0 0 * * *"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 10
    job_template {
      metadata {
        namespace = "db"
      }
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {

          }
          spec {
            container {
              name    = "backup"
              image   = "ubuntu:latest"
              command = ["/bin/bash", "-c", "sh /scripts/backup.sh"]

              volume_mount {
                name       = "backup-script"
                mount_path = "/scripts"
              }
            }
            volume {
              name = "backup-script"  # Same name as volume_mount

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