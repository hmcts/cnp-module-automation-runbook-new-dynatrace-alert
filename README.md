## Dynatrace Module

This Module will create a PowerShell runbook which creates a Dynatrace Alert via the Dynatrace API.

The runbook can either be created in an existing Automation Account OR created inside a new Automation Account (default).

Documenation on the Dynatrace API can be found [here](https://www.dynatrace.com/support/help/dynatrace-api).

```terraform
module "dynatrace_alert" {
  source = "git::https://github.com/hmcts/sds-module-automation-runbook-new-dynatrace-alert"

  automation_account_name = "sds-aa"
  resource_group_name     = "sds-rg
  location                = "uksouth"
  credentials             = [
                                {
                                    name        = "azure-credential"
                                    description = "a credential for azure access"
                                    username    = "azure"
                                    password    = data.azurerm_key_vault_secret.password.value
                                }
                            ]

  tags                    = var.common_tags
}

```

## Requirements   

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.automation_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) | resource |
| [azurerm_automation_credential.credential](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_credential) | resource |
| [azurerm_automation_runbook.new_dynatrace_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_runbook) | resource |
| [azurerm_automation_acount.existing_automation_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/automation_acount) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | name of automation account | `string` | n/a | yes |
| <a name="input_automation_credentials"></a> [automation\_credentials](#input\_automation\_credentials) | list of maps with credentials | `list(map(string))` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | azure location | `string` | n/a | yes |
| <a name="input_log_progress"></a> [log\_progress](#input\_log\_progress) | choose whether the runbook is to log progress | `bool` | `false` | no |
| <a name="input_log_verbose"></a> [log\_verbose](#input\_log\_verbose) | choose whether the runbook is to log verbose | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of resource group | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | sku of automation account | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |
| <a name="input_use_existing_automation_account"></a> [use\_existing\_automation\_account](#input\_use\_existing\_automation\_account) | if true, use existing automation account, if false, create new automation account | `bool` | `false` | no |

## Outputs

N/A