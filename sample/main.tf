terraform {
  required_version = ">= 1.0.5, < 1.1.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

output "generated_number" {
  value       = random_integer.suffix.result
  description = "The generated random 4-digit integer"
}
