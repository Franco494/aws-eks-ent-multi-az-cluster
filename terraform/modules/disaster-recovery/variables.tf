variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9-]*$", var.cluster_name))
    error_message = "Cluster name must start with a letter and contain only alphanumeric characters and hyphens."
  }
}

variable "kms_key_arn" {
  description = "KMS key ARN"
  type        = string
  validation {
    condition     = can(regex("^arn:aws:kms:[a-z0-9-]+:[0-9]{12}:key/[a-f0-9-]+$", var.kms_key_arn))
    error_message = "KMS key ARN must be a valid AWS KMS key ARN format."
  }
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}