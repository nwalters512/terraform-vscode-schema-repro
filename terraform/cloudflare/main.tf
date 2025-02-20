terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {}

resource "cloudflare_zone" "zone" {
  account = {
    id = "foo"
  }
  name = "foo"
}
