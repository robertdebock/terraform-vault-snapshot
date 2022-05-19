resource "vault_raft_snapshot_agent_config" "default" {
  count            = length(var.snapshot_agent_config)
  name             = var.snapshot_agent_config[count.index].name
  interval_seconds = var.snapshot_agent_config[count.index].interval_seconds
  retain           = var.snapshot_agent_config[count.index].retain
  path_prefix      = var.snapshot_agent_config[count.index].path_prefix
  storage_type     = var.snapshot_agent_config[count.index].storage_type
  local_max_space  = var.snapshot_agent_config[count.index].local_max_space
}
