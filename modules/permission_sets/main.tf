resource "aquasec_permissions_sets" "permissionSet" {
  
  is_super    = false # Ask your Aqua Admin for Super User access

  name        = var.permission_set.name
  description = var.permission_set.description
  ui_access   = var.permission_set.ui_access
  actions     = try(var.permission_set.actions,{})
}
