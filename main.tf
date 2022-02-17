terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.25.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
required_version = "~> 1.0.1"
}
resource "tfe_organization" "test-organization" {
  name  = "my-org-name"
  email = "admin@company.com"
}

resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = tfe_organization.test-organization.name
  tag_names    = ["test", "app"]
}