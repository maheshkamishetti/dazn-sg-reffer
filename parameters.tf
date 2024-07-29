resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project_name}/${var.environment}/app_sg_id"
  type  = "String"
  value = module.app.sg_id
}

resource "aws_ssm_parameter" "sg" {
  name  = "/${var.project_name}/${var.environment}/app_alb_sg_id"
  type  = "String"
  value = module.app_alb.sg_id
}