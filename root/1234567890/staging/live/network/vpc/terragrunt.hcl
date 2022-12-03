include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/network/${basename(get_original_terragrunt_dir())}/${basename(get_original_terragrunt_dir())}_live.hcl"
}
