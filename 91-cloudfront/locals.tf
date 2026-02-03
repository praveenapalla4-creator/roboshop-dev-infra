locals{
    cachingoptimised=data.aws_cloudfront_cache_policy.cachingoptimised.id
    cachingdisabled=data.aws_cloudfront_cache_policy.cachingdisabled.id
    certificate_arn=data.aws_ssm_parameter.certificate_arn
     common_tags={
        Project=var.project_name
        Environment=var.environment
        Terraform="true"
    }
    

}