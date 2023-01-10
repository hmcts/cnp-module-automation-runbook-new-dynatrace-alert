data "azurerm_automation_account" "existing_automation_account" {
  count               = var.use_existing_automation_account == true ? 1 : 0
  name                = var.automation_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_automation_account" "automation_account" {
  count               = var.use_existing_automation_account == false ? 1 : 0
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku
  tags                = var.tags
}