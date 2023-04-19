variable "snapshot_agent_config" {
  default = [{
    name             = "local"
    interval_seconds = "86400"
    retain           = 7
    path_prefix      = "/Users/robertdb/Documents/"
    storage_type     = "local"
    local_max_space  = 10000000
  }]
  type = list(object({
    name             = string
    interval_seconds = string
    retain           = number
    path_prefix      = string
    storage_type     = string
  }))
}

variable "aws_access_key_id" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
  validation {
    condition     = can(regex("^A..................Q$", var.aws_access_key_id)) || var.aws_access_key_id == null
    error_message = "When specifying an access key, please use the correct format."
  }
}

variable "aws_secret_access_key" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
  validation {
    condition     = try(length(var.aws_secret_access_key),"fourtybitsofrandomnessisnoteasytomakeman") == 40 || var.aws_secret_access_key == null
    error_message = "When specifying a secret key, please use the correct length."
  }
}
variable "aws_s3_enable_kms" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = true
  type        = bool
}

variable "azure_container_name" {
  description = "Used for azure-blob snapshots. (optional)"
  default     = null
  type        = string
}

variable "azure_account_name" {
  description = "Used for azure-blob snapshots. (optional)"
  default     = null
  type        = string
}

variable "azure_account_key" {
  description = "Used for azure-blob snapshots. (optional)"
  default     = null
  type        = string
}
