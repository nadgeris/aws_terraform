module "app" {
  source = "git::https://github.com/nadgeris/terraform-aws-app.git?ref=main"
  providers = {
    aws     = aws
    aws.dns = aws.dns
  }
  for_each                = var.app_resources
  namespace               = var.namespace
  private_subnet_id       = var.subnets[0]
  vpc_id                  = var.vpc_id
  key                     = var.ssh_key
  app-name                = each.key
  ami                     = each.value.image
  instance                = each.value.instance_type
  rds_password            = var.rds_password
  rds_endpoint            = var.rds_endpoint
}
