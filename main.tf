
# resource "aquasec_role" "roles" {
#     for_each = local.config.ROLES
#     depends_on = [ aquasec_permissions_sets.permissionSet, aquasec_application_scope.scopes ]
    
#     role_name = each.key
#     description = each.value.description
#     permission =  each.value.permissions
#     scopes =  each.value.scopes
  
# }




# resource "aquasec_permissions_sets" "permissionSet" {
#   # for_each = local.permissions_set.PERMSET
#   for_each = fileset("${path.root}/permission_sets/","*.yaml")
  
#   is_super    = false # Ask your Aqua Admin for Super User access
  
#   name = trimsuffix(each.key,".yaml")
#   description = each.value.description
  
#   ui_access   = each.value.ui_access
#   actions     = each.value.actions
  
# }


# resource "aquasec_application_scope" "scopes" {
#     for_each = { for scope in local.scope.SCOPES : scope.name => scope }

#     name        = each.value.name
#     description = each.value.description
#     categories {
      
#     dynamic "artifacts" {
#       for_each = each.value.artifacts != null ? each.value.artifacts : []
#       content {
#         dynamic "image" {
#           for_each = artifacts.value.image != null ? artifacts.value.image : []
#           content {
#             expression = image.value.expression
#             dynamic "variables" {
#               for_each = image.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }

#     dynamic "workloads" {
#       for_each = each.value.workloads != null ? each.value.workloads : []
#       content {
#         dynamic "kubernetes" {
#           for_each = workloads.value.kubernetes != null ? workloads.value.kubernetes : []
#           content {
#             expression = kubernetes.value.expression
#             dynamic "variables" {
#               for_each = kubernetes.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }

#     dynamic "infrastructure" {
#       for_each = each.value.infrastructure != null ? each.value.infrastructure : []
#       content {
#         dynamic "kubernetes" {
#           for_each = infrastructure.value.kubernetes != null ? infrastructure.value.kubernetes : []
#           content {
#             expression = kubernetes.value.expression
#             dynamic "variables" {
#               for_each = kubernetes.value.variables
#               content {
#                 attribute = variables.value.attribute
#                 value     = variables.value.value
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }

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

# module "permission_sets" {
#   source   = "./modules/permission_sets"

#   for_each = local.config.PERMSET
  
#   is_super    = false # Ask your Aqua Admin for Super User access
  
#   name        = each.key
#   description = each.value.description
  
#   ui_access   = each.value.ui_access
#   actions     = each.value.actions
  
# }

