#using open source module

# module "vote_service_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false 
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value
  
  
# } 



module "sg"{
  count=length(var.sg_names)
  source="git::https://github.com/praveenapalla4-creator/terraform-aws-sg.git"
  project_name= var.project_name
  environment= var.environment
  sg_name= var.sg_names[count.index]
  sg_description= "created sg for ${var.sg_names[count.index]}"
  vpc_id= local.vpc_id
}


# # Frontend accepting traffic from frontend alb
# resource "aws_security_group_rule" "frontned_fronetnd_alb" {
#   security_group_id = module.sg[9].sg_id #frontned secuirty groiup id
#   source_security_group_id= module.sg[11].sg_id # frontned load balancer id
#    type              = "ingress"
#   from_port         = 80
#   protocol            = "tcp"
#   to_port           = 80
# }