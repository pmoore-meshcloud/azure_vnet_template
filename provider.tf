terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.27.0"
    }
  }

}

provider "azurerm" {
  subscription_id = var.sg_subscription_id
  tenant_id       = var.sg_tenant_id
  features {}
}

