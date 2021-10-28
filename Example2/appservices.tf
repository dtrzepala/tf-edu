resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "azplan-example2-test-001-dt"
  location            = azurerm_resource_group.rg-application.location
  resource_group_name = azurerm_resource_group.rg-application.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = merge(azurerm_resource_group.rg-application.tags, { application : "example2" })
}

resource "azurerm_app_service" "appfrontend" {
  name                = "azapp-example2-test-001-dt"
  location            = azurerm_resource_group.rg-application.location
  resource_group_name = azurerm_resource_group.rg-application.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  https_only = true

  site_config {
    always_on     = false
    http2_enabled = true
    //    app_command_line = "pm2 serve /home/site/wwwroot --no-daemon --spa"   

    dynamic "ip_restriction" {
      for_each = var.ip_rules
      content {
        ip_address  = "${ip_restriction.value}/32"
      }
    }
  }
  app_settings = {
    "WEBSITE_VNET_ROUTE_ALL" : "1"
    "ASPNETCORE_ENVIRONMENT" : "Development"
  }
  tags = azurerm_app_service_plan.appserviceplan.tags
}