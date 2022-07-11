resource "azurerm_app_service_plan" "salutation-asp" {
  name                = "playground-salutation-asp"
  location            = local.location
  resource_group_name = local.resource_group
  tags                = local.common_tags
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_storage_account" "salutation-sa" {
  name                     = "playground-salutation-sa"
  location                 = local.location
  account_tier             = "Standard"
  resource_group_name      = local.resource_group
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_function_app" "salutation-fn" {
  name                       = "playground-salutation-fn"
  location                   = local.location
  resource_group_name        = local.resource_group
  app_service_plan_id        = azurerm_app_service_plan.salutation-asp.id
  storage_account_name       = azurerm_storage_account.salutation-sa.name
  storage_account_access_key = azurerm_storage_account.salutation-sa.primary_access_key

  tags = local.common_tags

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE       = "1",
    FUNCTIONS_WORKER_RUNTIME       = "node",
    WEBSITE_NODE_DEFAULT_VERSION   = "~14"
    APPINSIGHTS_INSTRUMENTATIONKEY = ""
  }

  version = "~3"

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"]
    ]
  }

  # FIXME: Use DNS names instead of enabling CORS
  site_config {
    cors {
      allowed_origins = ["*"]
    }
  }
}