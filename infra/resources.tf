resource "azurerm_app_service_plan" "ingestion-asp" {
  name                = ""
  location            = ""
  resource_group_name = ""
  tags                = ""
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_storage_account" "ingestion-sa" {
  name                     = ""
  location                 = ""
  account_tier             = ""
  resource_group_name      = ""
  account_replication_type = ""
  tags                     = ""
}

resource "azurerm_function_app" "ingestion-fn" {
  name                       = ""
  location                   = ""
  resource_group_name        = ""
  app_service_plan_id        = ""
  storage_account_name       = ""
  storage_account_access_key = ""

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