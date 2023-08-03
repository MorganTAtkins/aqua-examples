
resource "aquasec_application_scope" "scopes" {
    name        = var.scope.name
    description = var.scope.description

    dynamic "categories" {
      for_each = try(var.scope.categories, {})
      content {
        dynamic "artifacts" {
          for_each = try(categories.value.artifacts,{})
          content {
            image {
              # expression = "v1 && v2"
              dynamic "variables" {
              for_each = try(artifacts.value.image.variables,{})
                content {
                attribute = variables.value.attribute
                value     = variables.value.value
                }
              }
            }
            function {
              # expression = "v1 && v2"
              dynamic "variables" {
              for_each = try(artifacts.value.function.variables,{})
                content {
                attribute = ""
                value     = ""
                }
              }
            }
            cf {
              # expression = "v1 && v2"
              dynamic "variables" {
              for_each = try(artifacts.value.cf.variables,{})
                content {
                attribute = ""
                value     = ""
                }
              }
            }
          }
        }
      # dynamic "workloads" {
      #  for_each = try(categories.value.workloads, {})
      #   content {
      #     os {
      #       expression = "v1 && v2"
      #       dynamic "variables" {
      #         for_each = try(workloads.value.os.variables,{})
      #           content {
      #           attribute = ""
      #           value     = ""
      #           }
      #       }
      #     }
      #     kubernetes {
      #       expression = "v1 && v2"
      #       dynamic "variables" {
      #         for_each = try(workloads.value.kubernetes.variables,{})
      #           content {
      #           attribute = ""
      #           value     = ""
      #           }
      #       }
      #     }
      #     cf {
      #       expression = "v1 && v2"
      #       dynamic "variables" {
      #         for_each = try(workloads.value.cf.variables,{})
      #           content {
      #           attribute = ""
      #           value     = ""
      #           }
      #       }
      #     }
      #   }
      #   }

        # dynamic "infrastructure" {
        # for_each = try(categories.value.infrastructure,{})
        #   content {
        #     kubernetes {
        #       dynamic "variables" {
        #       for_each = try(infrastructure.value.kubernetes.variables,{})
        #         content {
        #         attribute = ""
        #         value     = ""
        #         }
        #       }
        #     }
        #     os {
        #       dynamic "variables" {
        #       for_each = try(infrastructure.value.os.variables,{})
        #         content {
        #         attribute = ""
        #         value     = ""
        #         }
        #       }
        #     }
        #   }
        # }
        # dynamic "entity_scope" {
        # for_each = try(categories.value.entity_scope, {})
        #   content {
        #     expression = "v1"
        #     dynamic "variables" {
        #       for_each = try(entity_scope.value.variables, {})
        #         content {
        #         attribute = ""
        #         value     = ""
        #         }
        #     }
        #   }
        # }
    }
  }
}

    # {} [templatefile("${path.module}/scopes/template/scopes.tf.tmpl", { 
    #   types = var.categories[*]
    # })]
  #     dynamic "artifacts" {
  #     for_each = try(local.is_artifacts ? [] : [1],{})
  #       content {
  #         dynamic "type" {
  #         for_each = try(local.artifacts ,{})
  #           content {
  #             expression = local.artifacts.expression
  #             templatefile("${path.module}/scopes/template/scopes.tf.tmpl", { types = var.categories[*] })
  #           } 
  #         }
  #       }
  #     }
  #   dynamic "infrastructure" {
  #     for_each = try(local.is_infrastructure ? [] : [1],{})
  #       content {
  #         infrastructure = templatefile("${path.module}/scopes/template/scopes.tf.tmpl", { types = var.categories[*] })
  #       }
  #   }
  #   dynamic "workloads" {
  #     for_each = try(local.is_workloads ? [] : [1],{})
  #       content {
  #         workloads = templatefile("${path.module}/scopes/template/scopes.tf.tmpl", { types = var.categories[*] })
  #       }
  #   }
  # }
# }      

    

    # dynamic "workloads" {
    #   for_each = try(each.value.workloads != null ? each.value.workloads : [],{})
    #   content {
    #     dynamic "kubernetes" {
    #       for_each = try(workloads.value.kubernetes != null ? workloads.value.kubernetes : [],{})
    #       content {
    #         expression = kubernetes.value.expression
    #         dynamic "variables" {
    #           for_each = try(kubernetes.value.variables,{})
    #           content {
    #             attribute = variables.value.attribute
    #             value     = variables.value.value
    #           }
    #         }
    #       }
    #     }
    #   }
    # }

  #   dynamic "infrastructure" {
  #     for_each = try(each.value.infrastructure != null ? each.value.infrastructure : [],{})
  #     content {
  #       dynamic "kubernetes" {
  #         for_each = try(infrastructure.value.kubernetes != null ? infrastructure.value.kubernetes : [],{})
  #         content {
  #           expression = kubernetes.value.expression
  #           dynamic "variables" {
  #             for_each = try(kubernetes.value.variables,{})
  #             content {
  #               attribute = variables.value.attribute
  #               value     = variables.value.value
  #             }
  #           }
  #         }
  #       }
  #     }
  #   }

