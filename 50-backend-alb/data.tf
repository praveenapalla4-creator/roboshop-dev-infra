data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}
data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/backend_alb_sg_id"
}
data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}
variable "zone_id"{
    default="Z0398365AXZ3ME1MH9EB"
}
variable "domain_name"{
    default="daws86s.help"
}