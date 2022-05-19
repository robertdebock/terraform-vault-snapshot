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

variable "aws_access_key_id" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
}

variable "aws_secret_access_key" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
}
