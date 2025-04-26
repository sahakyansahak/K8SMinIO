provider "kubernetes" {
  alias                  = "vm1"
  config_path            = "~/.kube/config_vm1"
  config_context         = "gke_development-huddle_us-central1-c_first"
}

provider "kubernetes" {
  alias                  = "vm2"
  config_path            = "~/.kube/config_vm2"
  config_context         = "gke_development-huddle_us-central1-c_second"
}

provider "helm" {
  alias                  = "vm1"
  kubernetes {
    config_path          =  "~/.kube/config_vm1"
    config_context       = "gke_development-huddle_us-central1-c_first"
  }
}

provider "helm" {
  alias                  = "vm2"
  kubernetes {
    config_path          = "~/.kube/config_vm2"
    config_context       = "gke_development-huddle_us-central1-c_second"
  }
}