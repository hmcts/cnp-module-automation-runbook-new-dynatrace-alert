variable "automation_account_name" {
  type        = string
  description = "name of automation account"
}

variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "location" {
  type        = string
  description = "azure location"
}

variable "use_existing_automation_account" {
  type        = bool
  default     = false
  description = "if true, use existing automation account, if false, create new automation account"
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "sku of automation account"
}

variable "tags" {
  type        = map(string)
  description = "tags"
}

variable "automation_credentials" {
  type        = list(map(string))
  description = "list of maps with credentials"
  default     = []
  sensitive   = true
}

variable "log_verbose" {
  type        = bool
  default     = false
  description = "choose whether the runbook is to log verbose"
}

variable "log_progress" {
  type        = bool
  default     = false
  description = "choose whether the runbook is to log progress"
}