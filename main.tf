resource "vault_raft_snapshot_agent_config" "default" {
  count                 = length(var.snapshot_agent_config)
  interval_seconds      = var.snapshot_agent_config[count.index].interval_seconds
  local_max_space       = try(var.snapshot_agent_config[count.index].local_max_space, null)
  name                  = var.snapshot_agent_config[count.index].name
  path_prefix           = var.snapshot_agent_config[count.index].path_prefix
  retain                = var.snapshot_agent_config[count.index].retain
  storage_type          = var.snapshot_agent_config[count.index].storage_type
  aws_s3_bucket         = try(var.snapshot_agent_config[count.index].aws_s3_bucket, null)
  aws_s3_region         = try(var.snapshot_agent_config[count.index].aws_s3_region, null)
  aws_access_key_id     = try(var.aws_access_key_id, null)
  aws_secret_access_key = try(var.aws_secret_access_key, null)
  aws_s3_enable_kms     = try(var.aws_s3_enable_kms, null)
  azure_container_name  = try(var.azure_container_name, null)
  azure_account_name    = try(var.azure_account_name, null)
  azure_account_key     = try(var.azure_account_key, null)
}

/* resource "vault_raft_snapshot_agent_config" "azure_backups" {
  name             = "azure_backup"
  interval_seconds = 86400 # 24h
  retain           = 7
  path_prefix      = "/"
  storage_type     = "azure-blob"

  # Storage Type Configuration
  azure_container_name = "vault-blob"
  azure_account_name   = var.azure_account_name
  azure_account_key    = var.azure_account_key
} */
