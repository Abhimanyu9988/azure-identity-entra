terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.44.1"
    }
  }
}


provider "azuread" {
  # Configuration options
}

provider "azurerm" {
  features {}
}

data "azuread_client_config" "current" {}


resource "azuread_application" "azuread_application" {
  display_name = "demo-app"
  owners       = [data.azuread_client_config.current.object_id, azuread_user.test-user.id]
  web {
    redirect_uris = ["http://demo-app-with-terraform.azurewebsites.net:8080/login/oauth2/code/"]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled     = true
    }
  }
  feature_tags {
    enterprise = true
    gallery    = true
  }
}

output "client_id" {
  value = azuread_application.azuread_application.application_id
}

output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}

resource "azuread_application_password" "azuread_application_password" {
  application_id = azuread_application.azuread_application.id
  end_date              = "2024-01-01T01:02:03Z"
}
 output "client_secret" {
  value = azuread_application_password.azuread_application_password.value
  sensitive = true
 }


resource "azuread_user" "test-user"{
    user_principal_name = "TestUser@${element(data.azuread_domains.aad_domains.domains.*.domain_name, 0)}"
    display_name = var.display_name
    mail_nickname = var.mail_nickname
    password = var.password
    force_password_change = true
}



output "user_principal_name" {
  value = azuread_user.test-user.user_principal_name
}

data "azuread_domains" "aad_domains" {}

resource "random_uuid" "example_administrator" {}

resource "azuread_application_app_role" "app_role"{
    application_id = azuread_application.azuread_application.id
    description          = "My role description"
    display_name         = "My role"
    allowed_member_types = ["User"]
    role_id        = random_uuid.example_administrator.id
    value                = "admin"
}
