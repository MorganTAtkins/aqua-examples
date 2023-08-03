resource "aquasec_role" "roles" {
    role_name   = var.role.role_name
    description = var.role.description
    permission  = var.role.permissions
    scopes      = var.role.scopes
}
