module "vpc" {
  source = "git::https://github.com/nadgeris/terraform-aws-vpc.git?ref=main"
  providers = {
    aws     = aws
    aws.dns = aws.dns
  }

  name              = var.name
  environment       = var.environment
  region            = var.region
  second_octet      = var.second_octet
  zone_id           = data.aws_route53_zone.selected.id
}

data "aws_route53_zone" "selected" {
  provider = aws.dns
  name     = var.zone
  vpc_id = var.hosted_zone_vpc_id
}