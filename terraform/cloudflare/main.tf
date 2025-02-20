terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

# The API token will be pulled from the `CLOUDFLARE_API_TOKEN` environment variable.
# Note that the API token must have the following permissions:
# Zone -> Zone Settings: Edit
# Zone -> DNS: Edit
# Zone -> Cache Rules: Edit
provider "cloudflare" {}

resource "cloudflare_zone" "zone" {
  account = {
    id = "foo"
  }
  name = "foo"
}
