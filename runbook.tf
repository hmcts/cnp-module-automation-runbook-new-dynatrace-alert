resource "azurerm_automation_runbook" "new_dynatrace_alert" {
  name                    = "New-DynatraceAlert"
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = var.use_existing_automation_account == true ? data.azurerm_automation_account.existing_automation_account[0].name : azurerm_automation_account.automation_account[0].name
  log_verbose             = true
  log_progress            = true
  description             = "This Runbook Creates a Dynatrace Alert using the Dynatrace REST API."
  runbook_type            = "PowerShell"
  content                 = file("${path.module}/New-DynatraceAlert.ps1")
  tags                    = var.tags
}