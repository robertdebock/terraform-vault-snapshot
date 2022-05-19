module "snapshot_agent_config" {
  source = "../../"
  snapshot_agent_config = [{
    name             = "hourly-keep-24"
    interval_seconds = "3600"
    retain           = 24
    path_prefix      = "/opt/vault/snapshots/hourly"
    storage_type     = "local"
    local_max_space  = 10000000
  },{
    name             = "daily-keep-7"
    interval_seconds = "86400"
    retain           = 7
    path_prefix      = "/opt/vault/snapshots/daily"
    storage_type     = "local"
    local_max_space  = 10000000
  },{
    name             = "weekly-keep-4"
    interval_seconds = "604800"
    retain           = 4
    path_prefix      = "/opt/vault/snapshots/weekly"
    storage_type     = "local"
    local_max_space  = 10000000
  },{
    name             = "monthly-keep-12"
    interval_seconds = "2419200"
    retain           = 12
    path_prefix      = "/opt/vault/snapshots/monthly"
    storage_type     = "local"
    local_max_space  = 10000000
  }]
}
