
resource "aquasec_image_assurance_policy" "image_assurance_runtime_policy" {
  name                                = var.controls.name
  application_scopes                  = var.controls.application_scopes
  allowed_images                      = try(var.controls.allowed_images  , null)
  audit_on_failure                    = try(var.controls.audit_on_failure , null)
  auto_scan_configured                = try(var.controls.auto_scan_configured , null)
  auto_scan_enabled                   = try(var.controls.auto_scan_enabled , null)
  cves_white_list_enabled             = try(var.controls.cves_white_list_enabled ,null)
  cvss_severity                       = try(var.controls.cvss_severity , null)
  cvss_severity_enabled               = try(var.controls.cvss_severity_enabled , null)
  cvss_severity_exclude_no_fix        = try(var.controls.cvss_severity_exclude_no_fix , null)
  cves_black_list_enabled             = try(var.controls.cves_black_list_enabled ,null)
  cves_black_list                     = try(var.controls.cves_black_list , [])
  cves_white_list                     = try(var.controls.cves_white_list , [])
  kube_cis_enabled                    = try(var.controls.kube_cis_enabled , null)
  disallow_malware                    = try(var.controls.disallow_malware , null)
  docker_cis_enabled                  = try(var.controls.docker_cis_enabled , null)
  domain                              = try(var.controls.domain , null)
  domain_name                         = try(var.controls.domain_name , null)
  dta_enabled                         = try(var.controls.dta_enabled , null)
  dta_severity                        = try(var.controls.dta_severity , null)
  enabled                             = try(var.controls.enabled , null)
  enforce                             = try(var.controls.enforce , null)
  enforce_after_days                  = try(var.controls.enforce_after_days , null)
  enforce_excessive_permissions       = try(var.controls.enforce_excessive_permissions , null)
  exceptional_monitored_malware_paths = try(var.controls.exceptional_monitored_malware_paths , [])
  fail_cicd                           = try(var.controls.fail_cicd , null)
  blacklist_permissions_enabled       = try(var.controls.blacklist_permissions_enabled ,null)
  blacklist_permissions               = try(var.controls.blacklist_permissions , null)
  blacklisted_licenses_enabled        = try(var.controls.blacklisted_licenses_enabled , null)
  blacklisted_licenses                = try(var.controls.blacklisted_licenses , [])
  block_failed                        = try(var.controls.block_failed , null)
  control_exclude_no_fix              = try(var.controls.control_exclude_no_fix , null)
  custom_severity_enabled             = try(var.controls.custom_severity_enabled , null)
  labels                              = try(var.controls.labels , [])
  forbidden_labels_enabled            = try(var.controls.forbidden_labels_enabled , null)
  force_microenforcer                 = try(var.controls.force_microenforcer , null)
  function_integrity_enabled          = try(var.controls.function_integrity_enabled , null)
  ignore_recently_published_vln       = try(var.controls.ignore_recently_published_vln , null)
  ignore_risk_resources_enabled       = try(var.controls.ignore_risk_resources_enabled , null)
  ignored_risk_resources              = try(var.controls.ignored_risk_resources , [])
  images                              = try(var.controls.images , [])
  malware_action                      = try(var.controls.malware_action , null)
  maximum_score                       = try(var.controls.maximum_score , null)
  maximum_score_enabled               = try(var.controls.maximum_score_enabled , null)
  maximum_score_exclude_no_fix        = try(var.controls.maximum_score_exclude_no_fix , null)
  monitored_malware_paths             = try(var.controls.monitored_malware_paths , [])
  only_none_root_users                = try(var.controls.only_none_root_users , null)
  packages_black_list_enabled         = try(var.controls.packages_black_list_enabled ,null)
  packages_white_list_enabled         = try(var.controls.packages_white_list_enabled ,null)
  partial_results_image_fail          = try(var.controls.partial_results_image_fail , null)
  read_only                           = try(var.controls.read_only , null)
  registries                          = try(var.controls.registries , [])
  registry                            = try(var.controls.registry , null)
  required_labels_enabled             = try(var.controls.required_labels_enabled , null)
  scan_nfs_mounts                     = try(var.controls.scan_nfs_mounts , null)
  scan_sensitive_data                 = try(var.controls.scan_sensitive_data , null)
  scap_enabled                        = try(var.controls.scap_enabled , null)
  scap_files                          = try(var.controls.scap_files , [])
  trusted_base_images_enabled         = try(var.controls.trusted_base_images_enabled , null)
  whitelisted_licenses_enabled        = try(var.controls.whitelisted_licenses_enabled , null)
  whitelisted_licenses                = try(var.controls.whitelisted_licenses , [])
  # dynamic "scope" {
  #   for_each = try(var.controls.scope, {})
  #   content {
  #     expression = scope.value["expression"]
  #     variables {
  #       attribute = scope.value["attribute"]
  #       name      = scope.value["name"]
  #       value     = scope.value["value"]
  #       }      
  #   }
  # }
  dynamic "custom_checks" {
    for_each = try(var.controls.custom_checks, {})
    content {
      author        = custom_checks.value["author"]
      description   = custom_checks.value["description"]
      engine        = custom_checks.value["engine"]
      last_modified = custom_checks.value["last_modified"]
      name          = custom_checks.value["name"]
      path          = custom_checks.value["path"]
      read_only     = custom_checks.value["read_only"]
      script_id     = custom_checks.value["script_id"]
      severity      = custom_checks.value["severity"]
      snippet       = custom_checks.value["snippet"]
    }
  }

# dynamic "auto_scan_time" {
#     for_each = try(var.controls.auto_scan_time, {})
#     content {
#       iteration      = auto_scan_time.value["iteration"]
#       iteration_type = auto_scan_time.value["iteration_type"]
#       time           = auto_scan_time.value["time"]
#       week_days      = auto_scan_time.value["week_days"]
#     }
#   }

  dynamic "forbidden_labels" {
    for_each = try(var.controls.forbidden_labels, {})

    content {
      key   = forbidden_labels.value["key"]
      value = forbidden_labels.value["value"]
    }
  }

  dynamic "required_labels" {
    for_each = try(var.controls.required_labels, {})

    content {
      key   = required_labels.value["key"]
      value = required_labels.value["value"]
    }
  }

  dynamic "trusted_base_images" {
    for_each = try(var.controls.trusted_base_images, {})

    content {
      imagename   = trusted_base_images.value["imagename"]
      registry    = trusted_base_images.value["registry"]
    }
  }
  
  dynamic "packages_black_list" {
    for_each = try(var.controls.packages_black_list, {})

    content {
      arch          = packages_black_list.value["arch"]
      display       = packages_black_list.value["display"]
      epoch         = packages_black_list.value["epoch"]
      format        = packages_black_list.value["format"]
      license       = packages_black_list.value["license"]
      name          = packages_black_list.value["name"]
      release       = packages_black_list.value["release"]
      version       = packages_black_list.value["version"]
      version_range = packages_black_list.value["version_range"]

    }
  }

  dynamic "packages_white_list" {
    for_each = try(var.controls.packages_white_list, {})

    content {
      arch          = packages_white_list.value["arch"]
      display       = packages_white_list.value["display"]
      epoch         = packages_white_list.value["epoch"]
      format        = packages_white_list.value["format"]
      license       = packages_white_list.value["license"]
      name          = packages_white_list.value["name"]
      release       = packages_white_list.value["release"]
      version       = packages_white_list.value["version"]
      version_range = packages_white_list.value["version_range"]

    }
  }

}