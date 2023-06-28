provider "helm" {
  # Several Kubernetes authentication methods are possible: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#authentication
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }

  # private registry
  registry {
    url = var.registry_url
    username = var.registry_user
    password = var.registry_password
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

variable "kube_config" {
  type    = string
  default = "~/.kube/prelude.config"
}

variable "namespace" {
  type    = string
  default = "vac"
}

variable "registry_url" {
  type    = string
  default = "oci://harbor.int.app-catalog.vmware.com/catalog_governor/charts/photon-4"
}

variable "registry_user" {
  type    = string
  default = "governor"
}

variable "registry_password" {
  type    = string
  default = "Governor12345"
}


# Creating namespace with the Kubernetes provider is better than auto-creation in the helm_release.
# You can reuse the namespace and customize it with quotas and labels.
resource "kubernetes_namespace" "namespce" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "redis" {
    name       = "redis"

    namespace  = var.namespace
    repository = var.registry_url
    chart      = "redis"
    version    = "17.11.0"

    set {
        name  = "master.persistence.enabled"
        value = "false"
    }

    set {
        name  = "replica.persistence.enabled"
        value = "false"
    }
}
