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
  validation {
    condition     = can(regex("^A..................Q$", var.aws_access_key_id)) || var.aws_access_key_id == null
    error_message = "Please use a valid access key."
  }
}

variable "aws_secret_access_key" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
  validation {
    condition     = length(var.aws_secret_access_key) == 40
    error_message = "Please use a key of 40 bytes long."
  }
}
