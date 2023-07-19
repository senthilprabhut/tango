variable "cluster_endpoint" {
  type    = string
  default = ""
}

# client certificate authentication
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#credentials-config
variable "client_certificate" {
  type    = string
  default = ""
}

variable "client_key" {
  type    = string
  default = ""
}

variable "certificate_authority" {
  type    = string
  default = ""
}

# VAC resource chart variables
variable "namespace" {
  type    = string
  default = "default"
}

variable "chart_name" {
  type    = string
  default = "redis"
}

variable "chart_version" {
  type    = string
  default = "17.11.0"
}

# VAC Registry variables
variable "registry_url" {
  type    = string
  default = "oci://harbor.int.app-catalog.vmware.com/catalog_governor/charts/photon-4"
}

variable "registry_user" {
  type    = string
  default = ""
}

variable "registry_password" {
  type    = string
  default = ""
}

# helm provider
provider "helm" {
  debug = true
  kubernetes {
    host = var.cluster_endpoint
    config_context = "none"
    client_certificate = base64decode(var.client_certificate)
    client_key = base64decode(var.client_key)
    cluster_ca_certificate = base64decode(var.certificate_authority)
  }

  # private registry
  registry {
    url = var.registry_url
    username = var.registry_user
    password = var.registry_password
  }
}

# VAC resource
resource "helm_release" "vac" {
    name       = var.chart_name

    namespace  = var.namespace
    repository = var.registry_url
    chart      = var.chart_name
    version    = var.chart_version
}
