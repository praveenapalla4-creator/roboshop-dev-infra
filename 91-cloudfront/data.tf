data "aws_cloudfront_cache_policy" "cachingoptimised" {
  name = "Managed-CachingOptimized"
}
data "aws_cloudfront_cache_policy" "cachingdisabled" {
  name = "Managed-CachingDisabled"
}

data "aws_ssm_parameter" "certificate_arn" {
  name = "/${var.project_name}/${var.environment}/certificate_arn"
}