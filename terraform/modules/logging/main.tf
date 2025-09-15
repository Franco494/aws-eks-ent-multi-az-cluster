locals {
  log_groups = ["application", "host", "dataplane"]
}

resource "aws_cloudwatch_log_group" "eks" {
  for_each          = toset(local.log_groups)
  name              = "/aws/containerinsights/${var.cluster_name}/${each.key}"
  retention_in_days = var.log_retention_days
  kms_key_id        = var.kms_key_arn
  tags              = var.tags
}