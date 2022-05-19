variable "snapshot_agent_config" {
  default = [{
    name             = "local"
    interval_seconds = "86400"
    retain           = 7
    path_prefix      = "/Users/robertdb/Documents/"
    storage_type     = "local"
    local_max_space  = 10000000
  }]
}
