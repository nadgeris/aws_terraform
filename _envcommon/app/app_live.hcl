terraform {
  source = "${dirname(find_in_parent_folders())}/_envcommon/${basename(get_original_terragrunt_dir())}"
}

locals {
  common_vars = yamldecode(file("${find_in_parent_folders("definitions.yaml")}"))
}

dependency "vpc" {
  config_path = "${get_original_terragrunt_dir()}/../../live/network/vpc"

  mock_outputs = {
    vpc_id         = "temporary-dummy-id"
    app_private_subnets   = ["temporary-dummy-id"]
    zone_id           = "temporary-dummy-id"
  }
}

dependency "rds" {
  config_path = "${get_original_terragrunt_dir()}/../../live/rds"

  mock_outputs = {
    rds_endpoint         = "temporary-dummy-id"
    rds_password           = "temporary-dummy-id"
  }
}

inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  subnets             = dependency.vpc.outputs.app_private_subnets
  rds_endpoint        = dependency.rds.outputs.rds_endpoint
  rds_password        = dependency.rds.outputs.rds_password
  zone_id             = dependency.vpc.outputs.zone_id
  zone                = local.common_vars.live.domain_name
  namespace           = local.common_vars.live.namespace
  profile             = local.common_vars.live.profile
  region              = local.common_vars.live.region
  app_resources    = local.common_vars.applications
  environment         = local.common_vars.live.environment
  ssh_key             = local.common_vars.live.key_name
}


generate "variables" {
  path      = "./imported_variables.tf"
  if_exists = "overwrite"
  contents  = file("${find_in_parent_folders("declare_variables.tf")}")
}