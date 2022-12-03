terraform {
  source = "${dirname(find_in_parent_folders())}/_envcommon/network/${basename(get_original_terragrunt_dir())}"
}

locals {
  common_vars = yamldecode(file("${find_in_parent_folders("definitions.yaml")}"))
}

inputs = {
  name              = local.common_vars.live.name
  profile           = local.common_vars.live.profile
  environment       = local.common_vars.live.environment
  region            = local.common_vars.live.region
  second_octet      = local.common_vars.live.network.second_octet
  zone              = local.common_vars.live.domain_name
  dns_region        = local.common_vars.live.dns_region
  dns_profile       = local.common_vars.live.dns_profile
  hosted_zone_vpc_id = local.common_vars.live.hosted_zone_vpc_id
}

generate "variables" {
  path      = "imported_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("${find_in_parent_folders("declare_variables.tf")}")
}