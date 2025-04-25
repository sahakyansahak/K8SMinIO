provider "kubernetes" {
  alias = "vm1"
  config_path = "~/.kube/config_vm1"
}

provider "kubernetes" {
  alias = "vm2"
  config_path = "~/.kube/config_vm2"
}

provider "helm" {
  alias       = "vm1"
  kubernetes {
    config_path = "~/.kube/config_vm1"
  }
}

provider "helm" {
  alias       = "vm2"
  kubernetes {
    config_path = "~/.kube/config_vm2"
  }
}
