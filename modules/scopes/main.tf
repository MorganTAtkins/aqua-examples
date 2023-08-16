
resource "aquasec_application_scope" "scopes" {
    name        = var.scope.name
    description = var.scope.description
    categories {
      # entity_scope {
      #   expression = "v1"
      #   variables {
      #     attribute = "application_scope.name"
      #     value     = var.scope.name
      #     }
      # }
      artifacts {
          image {
            expression = try(var.scope.artifacts.image.expression,{})
            dynamic "variables" {
            for_each = try(var.scope.artifacts.image.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
          function {
            expression = try(var.scope.artifacts.function.expression,null)
            dynamic "variables" {
            for_each = try(var.scope.artifacts.function.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
          cf {
            expression = try(var.scope.artifacts.cf.expression,null)
            dynamic "variables" {
            for_each = try(var.scope.artifacts.cf.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
      }


      
      workloads {
          kubernetes {
            expression = try(var.scope.workloads.kubernetes.expression,{})
            dynamic "variables" {
            for_each = try(var.scope.workloads.kubernetes.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
          os {
            expression = try(var.scope.workloads.os.expression,null)
            dynamic "variables" {
            for_each = try(var.scope.workloads.os.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
          cf {
            expression = try(var.scope.workloads.cf.expression,null)
            dynamic "variables" {
            for_each = try(var.scope.workloads.cf.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
      }


      
      infrastructure {
          kubernetes {
            expression = try(var.scope.infrastructure.kubernetes.expression,{})
            dynamic "variables" {
            for_each = try(var.scope.infrastructure.kubernetes.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
          os {
            expression = try(var.scope.infrastructure.os.expression,null)
            dynamic "variables" {
            for_each = try(var.scope.infrastructure.os.variables,{})
            content {
              attribute = variables.value.attribute
              value     = variables.value.value
            }
          }
        }
      }
    }
  }
