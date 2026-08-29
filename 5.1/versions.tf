terraform {
  required_version = ">= 1.5"

    required_providers {
      local = {
        soure = "hashicotp/local"
        version = "~>2.5.0"
      }
      random = {
        soure = "hashicotp/random"
        version = "~>3.6.0"
      }
    }
}