resource "azurerm_automation_runbook" "new_dynatrace_alert" {
  name                    = "New-DynatraceAlert"
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = data.azurerm_automation_account.automation_account.name
  log_verbose             = var.log_verbose
  log_progress            = var.log_progress
  description             = "This Runbook Creates a Dynatrace Alert using the Dynatrace API."
  runbook_type            = "PowerShell"
  content                 = file("${path.module}/New-DynatraceAlert.ps1")
  tags                    = var.tags
}