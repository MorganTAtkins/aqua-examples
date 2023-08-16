
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

# output "the-scope" {
#     value = try(var.scope, {})
# }
# output "scope-image" {
#     value = try(var.scope.artifacts[0], {})
# }
# output "scope-image-expression" {
#     value = var.scope.artifacts.image.expression
# }
# output "scope-artifacts" {
#     value = try(var.scope.artifacts, {})
# }

              # function {
              #   # expression = "v1 && v2"
              #   dynamic "variables" {
              #   for_each = try(artifacts.value.function.variables,{})
              #     content {
              #     attribute = ""
              #     value     = ""
              #     }
              #   }
              # }
              # cf {
              #   # expression = "v1 && v2"
              #   dynamic "variables" {
              #   for_each = try(artifacts.value.cf.variables,{})
              #     content {
              #     attribute = ""
              #     value     = ""
              #     }
              #   }
              # }
#             }
#           }
#         }
#       }
#     }
#   }
# }
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

