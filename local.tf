locals {
  # Get workspace configuration variables
  config = yamldecode(file("${path.module}/workspaces/${terraform.workspace}/config.yaml"))
}