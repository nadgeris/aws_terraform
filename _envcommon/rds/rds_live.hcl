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
    rds_public_subnets   = ["temporary-dummy-id"]
    vpc_cidr         = "temporary-dummy-id"
  }
}

inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  vpc_cidr            = dependency.vpc.outputs.vpc_cidr
  public_subnets      = dependency.vpc.outputs.rds_public_subnets
  namespace           = local.common_vars.live.namespace
  instance_type       = local.common_vars.rds.instance_type
}


generate "variables" {
  path      = "./imported_variables.tf"
  if_exists = "overwrite"
  contents  = file("${find_in_parent_folders("declare_variables.tf")}")
}