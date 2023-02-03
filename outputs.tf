output "runbook_name" {
  value = azurerm_automation_runbook.new_dynatrace_alert.name
}

output "runbook_id" {
  value = azurerm_automation_runbook.new_dynatrace_alert.id
}