module "app" {
  source = "../sg"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for ec2"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "app"
}

module "app_alb" {
  source = "../sg"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for APP ALB"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "app-alb"
}

resource "aws_security_group_rule" "app_alb_internet" {
  # Allow HTTP traffic from the internet to the Load Balancer
  security_group_id = module.app_alb.sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}

resource "aws_security_group_rule" "app_alb_to_app" {
  # Allow HTTP traffic from the Load Balancer to the EC2 instance
  security_group_id        = module.app.sg_id
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "app_ssh_access" {
  # Allow SSH access only from specific IP addresses
  security_group_id = module.app.sg_id
  cidr_blocks       = ["110.235.236.252/32"] # This should be a list of allowed IP ranges
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
}
