
module "permission_sets" {
  source = "./modules/permission_sets"
  for_each = fileset("${path.root}/rbac/permission_sets/","*.yaml")
  
  name = trimsuffix(each.key,".yaml")
  permission_set = yamldecode(file("${path.root}/rbac/permission_sets/${each.value}"))
}

module "policies" {
  source   = "./modules/policies"

  for_each = fileset("${path.root}/policies/","*.yaml")
  name     = basename(each.key)
  controls = yamldecode(file("${path.root}/policies/${each.value}"))
  depends_on = [ module.scopes ]
}

module "roles" {
  source     = "./modules/roles"
  for_each   = fileset("${path.root}/rbac/roles/","*.yaml")
  name       = trimsuffix(each.key,".yaml")
  role       = yamldecode(file("${path.root}/rbac/roles/${each.value}"))
  depends_on = [ module.permission_sets, module.scopes ]
}

module "scopes" {
  source   = "./modules/scopes"
  for_each = fileset("${path.root}/rbac/scopes/","*.yaml")
  name = trimsuffix(each.key,".yaml")
  scope = yamldecode(file("${path.root}/rbac/scopes/${each.value}"))
}
