# The Azure account name to use for storing the snapshot.
variable "azure_account_name" {
  description = "The Azure account name to use for storing the snapshot. (optional)"
  default     = null
  type        = string
}

# The Azure account key to use for storing the snapshot.
variable "azure_account_key" {
  description = "The Azure account key to use for storing the snapshot. (optional)"
  default     = null
  type        = string
}

# Make an Azure resource group
resource "azurerm_resource_group" "default" {
  name     = "vault"
  location = "West Europe"
}

# Make an Azure storage account
resource "azurerm_storage_account" "default" {
  name                     = "snapshots"
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Make an Azure container
resource "azurerm_storage_container" "default" {
  name                  = "vault-blob"
  storage_account_name  = azurerm_storage_account.default.name
  container_access_type = "private"
}

# Call the module.
module "snapshot_agent_config" {
  source = "../../"
  snapshot_agent_config = [{
    name                  = "hourly-keep-24"
    interval_seconds      = "3600"
    retain                = 24
    path_prefix           = "hourly"
    storage_type          = "azure-blob"
    azure_container_name  = azurerm_storage_container.default.name
    azure_account_name    = var.azure_account_name
    azure_account_key     = var.azure_account_key
  }]
}
