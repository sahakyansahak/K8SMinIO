resource "kubernetes_cron_job_v1" "mirror" {
    provider = kubernetes.vm2
  metadata {
    name = "mirror"
    namespace = "storage"
  }
  spec {
    concurrency_policy            = "Replace"
    failed_jobs_history_limit     = 5
    schedule                      = "0 0 * * *"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 10
    job_template {
      metadata {
        namespace = "storage"
      }
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {

          }
          spec {
            container {
              name    = "mirror"
              image   = "ubuntu:latest"
              command = ["/bin/bash", "-c", "sh /scripts/mirror.sh"]

              volume_mount {
                name       = "mirror-script"
                mount_path = "/scripts"
              }
            }
            volume {
              name = "mirror-script"  # Same name as volume_mount

              config_map {
                name = kubernetes_config_map.mirror_script.metadata[0].name
              }
          }
        }
      }
    }
    }
  }
}