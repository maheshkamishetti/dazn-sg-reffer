data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
} 

data "aws_ssm_parameter" "public_subnet_ids" {
 name = "/${var.project_name}/${var.environment}/public_subnet_ids"
  
}