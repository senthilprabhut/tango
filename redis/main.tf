provider "helm" {
  debug = true
  # Several Kubernetes authentication methods are possible: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#authentication
  kubernetes {
    #config_path = pathexpand(var.kube_config)
    host = var.cluster_endpoint
    #client_certificate = base64decode(var.client_certificate)
    #client_key = base64decode(var.client_key)
    cluster_ca_certificate = base64decode(var.certificate_authority)
    token = var.kube_token
    config_context = "none"
    #insecure = true
    #exec {
    #  api_version = "client.authentication.k8s.io/v1beta1"
    #  args        = ["--region", "us-west-2", "eks", "get-token", "--cluster-name", var.cluster_name, "--profile", "pam_eks-deployments-test-2-cluster-admin"]
    #  command     = "aws"
    #}
  }

  # private registry
  registry {
    url = var.registry_url
    username = var.registry_user
    password = var.registry_password
  }
}

variable "cluster_endpoint" {
  type    = string
  default = "https://10.89.92.5:6443"
}

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
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM2akNDQWRLZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1EVXhOakU0TWpnd05Wb1hEVE16TURVeE16RTRNek13TlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT04vCkRGN0tuRktOb0x2WWhNZ1h6ZTc3RStjOFZUUnlvOGQ2QUZUK1Mxb1llQzBzT1dHaEJ2TGhXaUl2QkNzZTNUbEIKbGlqenZkaHZIYXBMUFVXYUcvMFVReE5nUFpCaWdNT2ZRM2p5bEY5U21DaURaOVdnVE4zdmFIL2xralo5UkJjTAp5RnhKaWFpeWNjd1VDZ0RqNVhNUEZRVkxKbEdvTUVkcEJsZ2huSDRPN1hGalU2OXZOSzFXSDYyZGRrZ2RtY3ZkCmp4K3h0NjBYS1pNK0VkOG9kN09SNVY2TE9IcXFjbUZsMld1UndhRjlRRi80MmY0OHFnV3pwZWdMVW1UbE9oQWIKNmdUd00xUXBxNUwzenE4dmFlbjg0cnFhNGJjaDYxMW41U1l1MTAwcWJkc2xmMGt2eDBLMDVsWk5KMXFBRm5OdQpadlF5c2d4Yi93VzlDOGs0dm1rQ0F3RUFBYU5GTUVNd0RnWURWUjBQQVFIL0JBUURBZ0trTUJJR0ExVWRFd0VCCi93UUlNQVlCQWY4Q0FRQXdIUVlEVlIwT0JCWUVGTi8wRytJcTNicWJpbjNSNVEzZ0pZRkJueGIyTUEwR0NTcUcKU0liM0RRRUJDd1VBQTRJQkFRQWphdzY1RFBRNkxpNjJkaUJ2NWpDaU5vZmlNVWk4SERsTUVzRTU4NFE1N3oxdApENXk4MnhmUWRXSytvcy9keWxFQXo1b204M0paL21EQ0RzVE1jdHVGMFZRT2xZQ0NwTGNaVE5TTkRwQ0pNYkF5ClpVOUptLzNrNThxOU9odVdnVkxSQnJlbVY3Z1lXenFCN0kwN1BjQ2pOSHdlNFB5dXhRU2VqMHFzZ0g0bGZiNWwKem1EbmdzUm1GWlhia2VqMytVNGlhSmxDejk1NGVnaEdNZzB6a3BNdzFoZTcvWWNTZWdGY0tpZFRUUVllTDk4dApLM0lTZGhUMHRuYjNMQVR0N2ZwU09uUXU4VEZPc21zMXJuN3RIR0Z3Zm5Fbk1RUktNR0pjZjE1OUc3K3lNQWVVCm1Hd2tWWm9RaGxHeVUzb0xtV0NUYnByRERPTE52OG5kOWV1WkZWNmMKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
}

variable "kube_token" {
  type    = string
  default = "eyJraWQiOiI0MEIwQzBCRDUwRjZGNEVFMTVBNTE1ODAwMTI0M0RBNzhDREY4NEIxIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJBZG1pbmlzdHJhdG9yQHZzcGhlcmUubG9jYWwiLCJhdWQiOiJ2bXdhcmUtdGVzOnZjOnZuczprOHM6MDE3OWFhYTctMmNkYi00OWY3LTg4NjgtNjJlNTkxZGRkMTVjIiwiZG9tYWluIjoidnNwaGVyZS5sb2NhbCIsImlzcyI6Imh0dHBzOlwvXC9jbWJ1LXRhbnp1MDEtdmMwMS5lbmcudm13YXJlLmNvbVwvb3BlbmlkY29ubmVjdFwvdnNwaGVyZS5sb2NhbCIsImdyb3VwX25hbWVzIjpbIkxpY2Vuc2VTZXJ2aWNlLkFkbWluaXN0cmF0b3JzQHZzcGhlcmUubG9jYWwiLCJTeXN0ZW1Db25maWd1cmF0aW9uLlJlYWRPbmx5QHZzcGhlcmUubG9jYWwiLCJTeXN0ZW1Db25maWd1cmF0aW9uLlN1cHBvcnRVc2Vyc0B2c3BoZXJlLmxvY2FsIiwiQWRtaW5pc3RyYXRvcnNAdnNwaGVyZS5sb2NhbCIsIkV2ZXJ5b25lQHZzcGhlcmUubG9jYWwiLCJDQUFkbWluc0B2c3BoZXJlLmxvY2FsIiwiQ2xvdWRBZG1pbkdyb3VwQHZzcGhlcmUubG9jYWwiLCJTeXN0ZW1Db25maWd1cmF0aW9uLkFkbWluaXN0cmF0b3JzQHZzcGhlcmUubG9jYWwiLCJTeXN0ZW1Db25maWd1cmF0aW9uLkJhc2hTaGVsbEFkbWluaXN0cmF0b3JzQHZzcGhlcmUubG9jYWwiLCJVc2Vyc0B2c3BoZXJlLmxvY2FsIl0sImV4cCI6MTY4ODcyMjk4MywiaWF0IjoxNjg4Njg2OTgzLCJqdGkiOiIwMGM2ZmRlMy00ZGYxLTRkYzYtODE2OS02N2MyZWIxYjJlNjUiLCJ1c2VybmFtZSI6IkFkbWluaXN0cmF0b3IifQ.RP2FOscMdhbr-OeWQpGjMBzR-lIfrCp72DywPTuP-94JLKXTeF0lWTYxtZj2nMy7ixXZ8oMP5NM49zMFmuaWbR7bRMtTDQPRY2NUKZG4dLUxZy901KenMkP13uHoAvhwbfR3E90tbO5jTQqljx16hj7o2Xv-2cBKBoxZJ2d4Qkiz6qQxr7kafGgSZzvTWn_mF0X9Cefa0JIYITS7C7S1NkvTPIqGmmrBfhSvcUlcCzoHYb3phe6qqG_V1CSslBbsuuvwWEDbPwT5jri6EOWKWVUzVeU80LvSUXWJFU-MsB3x2GQ4dUDiEiYp8BLdaYq_t9t7zeB52WJ-c5l0QlhIzA"
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "namespace" {
  type    = string
  default = "default"
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

resource "helm_release" "redis" {
    name       = "redis"

    namespace  = var.namespace
    repository = var.registry_url
    chart      = "redis"
    version    = "17.11.0"

    #set {
    #    name  = "master.persistence.enabled"
    #    value = "false"
    #}

    #set {
    #    name  = "replica.persistence.enabled"
    #    value = "false"
    #}
}
