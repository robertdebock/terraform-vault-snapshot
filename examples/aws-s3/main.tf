# The s3 snapshot needs AWS access.
variable "aws_access_key_id" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
}

# The s3 snapshot needs AWS access.
variable "aws_secret_access_key" {
  description = "Used for aws-s3 snapshots. (optional)"
  default     = null
  type        = string
}

# Generate some random stuff, buckets need a unique name.
resource "random_string" "default" {
  length  = 4
  special = false
  upper   = false
}

# Make an s3 bucket.
resource "aws_s3_bucket" "default" {
  bucket = "my-vault-snapshots-${random_string.default.result}"
  tags = {
    owner        = "robertdebock"
  }
}

# Call the module.
module "snapshot_agent_config" {
  source = "../../"
  snapshot_agent_config = [{
    name                  = "hourly-keep-24"
    interval_seconds      = "3600"
    retain                = 24
    path_prefix           = "hourly"
    storage_type          = "aws-s3"
    aws_s3_bucket         = "my-vault-snapshots-${random_string.default.result}"
    aws_s3_region         = "eu-west-1"
    aws_access_key_id     = var.aws_access_key_id
    aws_secret_access_key = var.aws_secret_access_key
    aws_s3_enable_kms     = true
  }]
}
