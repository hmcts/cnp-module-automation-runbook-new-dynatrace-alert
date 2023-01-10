resource "azurerm_automation_credential" "credential" {
  for_each                = var.automation_credentials
  name                    = each.value.name
  resource_group_name     = var.resource_group_name
  automation_account_name = var.use_existing_automation_account == true ? data.azurerm_automation_account.existing_automation_account[0].name : azurerm_automation_account.automation_account[0].name
  username                = each.value.username
  password                = each.value.password
  description             = each.value.description
}