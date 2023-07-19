variable "cluster_endpoint" {
  type    = string
  default = "https://10.89.92.6:6443"
}

# client certificate authentication
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#credentials-config
variable "client_certificate" {
  type    = string
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFekNDQWZ1Z0F3SUJBZ0lJTWZYTklIdEJsNDB3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpBM01Ua3dNRE0yTURkYUZ3MHlOREEzTVRnd01EUXhNRGhhTURReApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sa3dGd1lEVlFRREV4QnJkV0psY201bGRHVnpMV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXVUVk5EbnUxRDdURTdjNnQKdW5ZOGUrY0lWM21xZlZ5UFZMRWJsczE4ZGJaN2Z3MzJBZXdTRTFZdU5jWEV5NCtPR0xDQjdiN0VzazlycFZKYQpJd3padjBQWkIxeW9kZjRPRUd0WXhQSWZqV0JGTjhYaHk1OTRkWmVLZ2JwaVFOeTM2RlpwYmNDWGxteis3K28vCnI3VDRBdVk2MjdCa1NlbjlVRWwwRVhEb01mc2UwR1FMWXV3eTlMOXpFNEo0ckRLbjYwTHV4OUx1cE9sdC92ZWUKMTRqaTZ2UjJMb2dsVFJydDhIaWVMb2ZjcTZZcnNFVHNXRzRkU1hta3c5RW5pbGVwQmwyWEhGc2ptZE9jb1psWgpGbFNPNGtKOWdVMzlRckEvY01YdE1HK3V2UkRxOVJwOSs5eXVNRCtUdksxTGFPa1prSDdUN2dyd3I1b2g2MUp0Ckk1cndtd0lEQVFBQm8wZ3dSakFPQmdOVkhROEJBZjhFQkFNQ0JhQXdFd1lEVlIwbEJBd3dDZ1lJS3dZQkJRVUgKQXdJd0h3WURWUjBqQkJnd0ZvQVVBcFpDVG84SnRnOXJIbi9TQkw5aUJQd0lnOEV3RFFZSktvWklodmNOQVFFTApCUUFEZ2dFQkFLRm0rTTVoaGlHcGtyYWhXZU1qaHBJMTZQbTRVSGVFaGdzdytOSFk5cjBrTVRzTVlZeXZqS3E2CnhVMzZQWUZLZEMyOUNPODVvbFZwR1IyR21DU1pxemdhaUdkTkVhalJOcUlrU3FNZW05djVZSGcvOHUwcVdwRlYKd1ExVHdMcDRKZ0ZjRStNZTlrZ3ArRlNlRWRzNHNlYnRVWHdqdnJkdjRvZnY4MGdmTVp5OUNCM2xTamJaSFU4SgplS1paR1dXbXpQVXNQdDE1b2szN0ZpNkxVMlBYVGR1d1JCVzdPaUFCTjc1ZTRnUVJyVmJBUitySlhIMC84RnJwCnNxdUFyVWJmUDAza1U5N2NsdWlsY2JxZER4azBONHVCTXl3SUhGTisxN2pmS3FDeEQwZ1ovME1yZTR6ZnNZM3kKalQvR1lLdHFmVjVZT1Q4bkFqM3JQUEZGYWJmL3NvRT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
}

variable "client_key" {
  type    = string
  default = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdVRWTkRudTFEN1RFN2M2dHVuWThlK2NJVjNtcWZWeVBWTEVibHMxOGRiWjdmdzMyCkFld1NFMVl1TmNYRXk0K09HTENCN2I3RXNrOXJwVkphSXd6WnYwUFpCMXlvZGY0T0VHdFl4UElmaldCRk44WGgKeTU5NGRaZUtnYnBpUU55MzZGWnBiY0NYbG16Kzcrby9yN1Q0QXVZNjI3QmtTZW45VUVsMEVYRG9NZnNlMEdRTApZdXd5OUw5ekU0SjRyREtuNjBMdXg5THVwT2x0L3ZlZTE0amk2dlIyTG9nbFRScnQ4SGllTG9mY3E2WXJzRVRzCldHNGRTWG1rdzlFbmlsZXBCbDJYSEZzam1kT2NvWmxaRmxTTzRrSjlnVTM5UXJBL2NNWHRNRyt1dlJEcTlScDkKKzl5dU1EK1R2SzFMYU9rWmtIN1Q3Z3J3cjVvaDYxSnRJNXJ3bXdJREFRQUJBb0lCQVFDdTIvN3poS0p1d0xvSQoxOUE0TW5kcWQ3YnRkOFlhYzdBelFyK01nbGRXZjhKYk02QW5NbTNpYWNSWkttNWh6aGhYZ1JZNms1ajd6SFlTCmNReisrSndBczVzTkUxTk5pMTVWN0RPMFJmQzZOc0ZESmdYSGpMbGJOSWNsY2daZnZNTzVqUlFlOWUxb3JXR0kKdTc0RE16WFE3dk4xQlRXNmZ6dVZlTFFuMzFTcUVoSW8zM3NpRUlHYXVGV2duamhFa2lWa3dzRFRiYWhkcGR4MgpHbERUT2YyY0ozTTA2WmQvRE1KYkZrdFdBblpiYWFTZG5qQTRhZDFQVTdhVjFVck9XYVErWFF3TFMremZ2UURwCk85VnNPYkhJOE1vRUxGNnBVUFlYL1pQS0lqdG9mZmZ3QmgrOGZ6U2ZTa2k0ODh0NzY5WlB3dlpDRUdxT09GeXcKZS9mOUNOUTVBb0dCQU1BMnRHTUljOUZLS1AxV3pSdHc1dURJVlEwQjRhRDcwb0xhSmI3aUZacDhYNmRSdlpDMgpIRGQwVjlKcEZva0ZiRTJSN3VOR05UVEd4WFpjN2Z1akEwWEZVNGl2aUxOWFlZODdIMVJpVVU5VUlHNlNMM2M5ClNkVWcxdE5yTnRLZEFzMTRBMEpUVXRlS2cxWHUrZG8zSnBJRmZwWGwxUzJvRzhyMS84ZmZkNDlYQW9HQkFQYXIKZEJxdi9jSm56bi9MbUdsTURQZnpGcElRNG8zeUhQelR2Wm9kRVFJeC8xb3FsVU80NGhXc2o4aU9KY091Z0RQdwpYL01DR2swVXY3ZDBUQkJPQURmNkk5bm5ZakhyUTJhWTBqMnpDMGRqaGlRKzdvU3NjYWFUMGtXNUVRQ1d5c1QyCkZvYkxiTTFJVUZXalVNZlIycTYzb0NLYTlibWlna01sSWJDeGpsSmRBb0dBS2lKVHZIbTMyYUxtQlZLbnQySXkKV2dmUURQL2lrOFZmeWV0RDV1bnNUbWNCR001a1BYcU9DT0hwOW1ldTF1NW5aVUdlR2hmanhlUGttU09aejFWVwpmRTdiRnRWVG8reDlxRVlQZ2hIalBQNTE5WWI1L0t0a3FlRis5ZTFFb1RwbHlPQ0w1bGdaaXNJRU5Dd2tmTjhtCkIxQkpCVmJTT2lYbG9jSDNCYnRJbkJVQ2dZRUFnVnpWblJGakljdFREczUxZGZOK2NhSzQyWTJsWXcvd2g5OTcKOWhEOFZJeG9BSitJZkdXL20rSk4zYjQrcStzZUxSOEpFdWF0YUhOVFFDRHJxemxjLy81ZFF2QUlIV25taFMzcwpSSk5iZk9zQzlJdFVoNXZ3Vm8zN25yazU0M2N4akM0TERsSXRFMU96WGRZeWpUalBXUVhRSTVYay9KL3ZkTXRLCmFlSVVZN2tDZ1lBcFVpVnVqZ21RZlBOQU1zOEJtTWZhZlFLWllxOWlpTlM1K3RXUzM2dGZXdHhZSTZ5V29WUFEKUk5jOTY4WWlaNEg2RUR2bmhST1MwNG9TTkpMc0dyNU5mL3ErU0ZQSkFnekJ6QkRrc3BoUC9WcVIvdnNCNUQ2WApxdWtERWt1ZXRERDFWeWRUbGV6a25CNzFWRGUwOWR6UEVJejI2MUN5aTllcW5JWXZ0UFBpdWc9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo="
}

variable "certificate_authority" {
  type    = string
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM2akNDQWRLZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJek1EY3hPVEF3TXpZd04xb1hEVE16TURjeE5qQXdOREV3TjFvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTDdUClo2a2IwWVByTnRPekZ6QU84RENrRkJrb2tJaGtxNUVTRUJMaHZCRDZCSU1GRXU3ZE1IRnpSYVcyclhBWkx6VG4KQjlONnRYMVNIOWswUUE1SHM5Q2Fkdm41T2hxOVhWTEVyT1MzUE1QTzRBS0MzVG5uZlgxZ0lGbU1CWUZXaXpBQQpRR3Y4ZFlnVURzd3NGY2s5WmtGNUxsZlJtSENuQ3p6WDV4dGl0MXFuSUtHY0hIaWVXWTljSjRlQ2kzRlF2OG0xCkxIZEN3Wlp3S0ZtV2tqZkNRcjFOZnFOWGhVS0hPY0JoeXE4N2swa0VEY3pnRVF3RnV0bS9OL0V3UGg1Z2tjbTcKRW40U2R2VWRQVjdMRXgxcTZBbHFrWlZ6S2I0UWdhYk5Ka0dMNllhNlcybEhCUnlPTFBKNndPczBHSEp0R0ZnUQpnRFBZa0d6NUxuY3Yzc0Y1ZzFFQ0F3RUFBYU5GTUVNd0RnWURWUjBQQVFIL0JBUURBZ0trTUJJR0ExVWRFd0VCCi93UUlNQVlCQWY4Q0FRQXdIUVlEVlIwT0JCWUVGQUtXUWs2UENiWVBheDUvMGdTL1lnVDhDSVBCTUEwR0NTcUcKU0liM0RRRUJDd1VBQTRJQkFRQ3dGUm9FdWptTmJQL0wyVU9NVGI0a0taRUVhRXhWSS9SNTZRM3RWbHBvd0pzYwpmVDkxYkl6ZnpYMTZZTFN1T2Yya1Vvb1RLV1ZGQWZ0cWE1QVMwYm1JK01WeGk2VDBJcTNFVEJzNmVlNUFYUW9uCmZmREpXM3d6Y3M4dWp6ME9rdlpzQmd3czlyS3E0c1NBM2RaMngrRkhINTJ5eUVlVzYyL2ZwbjltV0ZDNU1pN2QKbytKdHFiazdQd2ZuNVRGNXlVVjN3ZUMzbjUwZng2OExNUVZrVWdBRDY2bTRxUzVSMjg4ckVWakhkUEJyM3lVdwpNd0MzQmpGdjArMzFJVlE1bE5CME1XdzdMQ3Q0YmpIQ2RSTGx0MXA0N0Z3cWNMSnUwSWVqK1NYWEpqL3FkWVp2CnBCcEVPUGJkV0k2Q00wU0hOVXFITGpXeE1nZW1xK3I4Z053aUt5SE8KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
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
  default = "governor"
}

variable "registry_password" {
  type    = string
  default = "Governor12345"
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
