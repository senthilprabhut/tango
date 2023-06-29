provider "helm" {
  # Several Kubernetes authentication methods are possible: https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#authentication
  kubernetes {
    #config_path = pathexpand(var.kube_config)
    host = var.cluster_endpoint
    client_certificate = base64decode(var.client_certificate)
    client_key = base64decode(var.client_key)
    config_context = "none"
    insecure = true
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
  default = "https://cava-6-000-096.eng.vmware.com:6443"
}

variable "client_certificate" {
  type    = string
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJZmxpY3h2VGlRNFl3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXd3S2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpBMk1qSXlNek0wTXpKYUZ3MHlOREEyTWpJeU16TTBNemxhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQW9NL1BaWldpL0NDaTdDZlIKbDZhWC82TW9qYWUzYjJXSkVHL0JHL1prbkQ3ZHlLRlFXeFhqb2pXOHZNdm1iT0RpNmNQQmVkaHBrUWU4RzdHWgo1NDF0VU9QN0J5d09JZENMbUdUU1dGczZncG5kc25qYjVjZWI0M093QXB5YUhvVHhERG16OWtaNWRKQTJVZnl1Cmh1dng0b1l5T08yRm1KMVZLRWR5YmtsMlpKMitLQVJVZ0tPNitnT1BmUnVvNVZqekgwamFFQTRDc0QxTEQ1dkwKZTlWSHN6STJYelkxRFZ6ckExb1NBYnc3WGl3VEJjS2l3amRMTTBiem5yWFRkYUtoUkRQbEV5Z3ZLSUZwczhyVQp3SlB5YVkzdW9OSEdBS0ZJY2NnVm95MExYcUZLQmROd2dJUXBVSnVzNzN6b2VtazZMbkE1NWp1d2x2VkhTZzVZCkpHWUxJd0lEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVU0bTMyMWNEakZIR28zQlJDOVRJaU03ai8xSkF3RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFLdlZYRWMrL2RVN2k1eFZQVnI1dllNQW00eDMyQkVrL0VWUEpmV3JwaWRnZktWSGhxaUcwYzBpCmU5SmR1NC8xQ1o0VXNCY3R3UzIzaUJhSjdRWVhjSE5uZ0tZc3NsTlp6MWVLUXhvOTRBYzAvOU5xZDl6SHJaZHEKY0NFWWdmM3NWUjFlMFl3NDJpNVUrcXQxaVE3eWE0aXVUUEJPcXFJUUNPUG81N05NT0oxV3dWdHRQb1pPN0lpNQpEaVp3RVpLZm1MaEhjN3NRbHRTNGJIcW1ESDNYS1NxeGMwRHdlZVpFVGtvOXZ3a0hNM2J0bi82TmRuMGNhYWZwCmw2QmZwY1pHMUJIblN3aUswTE5UTjF0OUliRVFhdXJvY1BaVG5GbVR0MjEwYmFVcnJXNEdzWGhxdXRMWjk0aXIKd1I5SlVZRXBqbVdTaW5OeGxpN0JpVjh0Y3crLzFMND0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
}

variable "client_key" {
  type    = string
  default = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBb00vUFpaV2kvQ0NpN0NmUmw2YVgvNk1vamFlM2IyV0pFRy9CRy9aa25EN2R5S0ZRCld4WGpvalc4dk12bWJPRGk2Y1BCZWRocGtRZThHN0daNTQxdFVPUDdCeXdPSWRDTG1HVFNXRnM2Z3BuZHNuamIKNWNlYjQzT3dBcHlhSG9UeEREbXo5a1o1ZEpBMlVmeXVodXZ4NG9ZeU9PMkZtSjFWS0VkeWJrbDJaSjIrS0FSVQpnS082K2dPUGZSdW81Vmp6SDBqYUVBNENzRDFMRDV2TGU5VkhzekkyWHpZMURWenJBMW9TQWJ3N1hpd1RCY0tpCndqZExNMGJ6bnJYVGRhS2hSRFBsRXlndktJRnBzOHJVd0pQeWFZM3VvTkhHQUtGSWNjZ1ZveTBMWHFGS0JkTncKZ0lRcFVKdXM3M3pvZW1rNkxuQTU1anV3bHZWSFNnNVlKR1lMSXdJREFRQUJBb0lCQURQWkRKdEtGWlNJeVQ2dQp6K3EvTWI2Z1VsRHB4RURNVWRiVTBVUTh1cytOaldCRWNtNExycXI3L0hBNnBYNXhPM2YzUDRnVGVHWGtRb2dEClNRWFpHV2U5T1pCa2FlSUpKUmpyV001WUM1TlVIS0NRU3dYWXg3QWIrcUc4OEF2cS9QVGVIZUhIY3gxYjZjZWgKV252eDBya2dYMHp2ZCtWdXhLZ0o4U0VSMm5ReHpDeUdtdmxTc2tyazcwWHp0aEtXOGZVa1BwY3U5Qjh5dW5pMgpVdGVWZk10RU9SNlhCMkpCQnNKYWV4T1laMlVKWHl0VnRNbkxUMjc1RnlLSXZGUnBHem1pN05EcndzWTRCaHg5Ck1saE0rNmJUY0F4WHFBU3VSZUh3UjNrOURFdFIwM1NTOGwvbkEwTjBLMlVUMjI1Zzdwb3Ura3JuWnE4dWNHMzAKcnUxLzl1RUNnWUVBNFo4bXJKcysvMGZXSjk0VDhZVXZhdW9wUU0vcDNQRHgwS1g2aVJOZDY2N0FhR3BkOUs4MwovR2lSTWc1VHlXZGVPeElWNnlHZEVqK21PbkQxUUY5Z25hdFI3MTVyV3pJTm9qeHNoamtQcm9GbHhDbjIwcTIxCnhXTXBsbmt3cFFpVHRQOTcwVUpITWRHV2h5ZFVOYzRnN2QyaFY4QWx0RDJUYWJJUzR3MlFOanNDZ1lFQXRuYkIKZ1dzT0wxVEFqcXUzR1lIaEg1UEVYMUkvUzJaNlpLOHB3Znd5eUFGdGRtWndDTkNiTnh4MEpXVlM4TGtVSEY4YQpwdEV2TGZLSDlVQjF5WkdIRFcwTUN5REd4REJJS05IdGhwc2FlVGVmQ0VidUZxdzdVbVlYUlZyVVIybTZKVVJMCnd2azJLd0ZwNmZESGMvWGVEc2VlR2NqVEhRRmkxdXpsOUMybWFEa0NnWUJiUGFnL0x6MEhzWDVhZXdXbnEwdWsKdWZOYTRYbmF2cG1iM2pOMkVaM3V2S25VMEFjVTkzTDFvVGZ1ZlRyRy9RVnZiLzNySzVuQWtucmZzV1NNMXNWVQpuYjZ4eFlZMnlBUVpjc1FVZDZqdTBpZGNiL2YvOVAzSVNEUytSRjQycjBSRWN2a1lnK3dVcW9Sc1BheGhZZTJSCkpBcW1XTzhtZDZ4UWx4SHFQa2J1bHdLQmdRQ2QwazVCa01XdUx0SjNGUlBFbmxDSXJabFhFWjdwcXZRR2puUEIKOUZCQUt1dnhVMTFvWW5jK3pmK3dNTm55bVVOSjN3RUFkVU1uclBYb0xoOHpnQXFlbEVtc2ZtY3VYc3lyY2hqUApLdTFWRjhVWXRiRk9MeDhJZ0lGMFhjSHJHd29GSGZPaDYwanRIY1hzc1hUeldpRCtDNjgyZ2p3SWhLQm5ZblRzCkpXZ2dFUUtCZ0dMRXdkY05tSFMzUi9vMUxEVFAwdlBEcFY1YnNUdXkyUmFhT1owaUF6dE9idkltK05xRkN0UzAKeHJxc0o2aE5CSDNIbytvRFpWK21jNytRb1dJdHk1WTR4KzFueG1GZXgvV3BZZmlNbkZxbjdxZjI4YkppOUNwdQpxQjdqdGdmWnZyVEhuQldRcmRpd3JheDgvclptQTFyeW1oZVJlczY3MkdhcnVxUlBocHdMCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=="
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
