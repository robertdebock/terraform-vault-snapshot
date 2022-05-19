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
  aws_s3_enable_kms     = true
}


# resource "vault_raft_snapshot_agent_config" "s3_backups" {
#   name             = "s3"
#   interval_seconds = 86400 # 24h
#   retain           = 7
#   path_prefix      = "/path/in/bucket"
#   storage_type     = "aws-s3"
#
#   # Storage Type Configuration
#   aws_s3_bucket         = "my-bucket"
#   aws_s3_region         = data.aws_region.current.name
#   aws_access_key_id     = var.aws_access_key_id
#   aws_secret_access_key = var.aws_secret_access_key
#   aws_s3_enable_kms     = true
# }
