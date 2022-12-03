module "rds" {
  source = "git::https://github.com/nadgeris/terraform-aws-rds.git?ref=main"
  providers = {
    aws     = aws
  }

  name                       = var.namespace
  subnet_ids                 = var.public_subnets
  vpc_cidr                   = var.vpc_cidr
  vpc_id                     = var.vpc_id
  instance_type              = var.instance_type
}
