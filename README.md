# Aqua Terraform

CLI:
```
terraform apply -var aqua_password='******' -var aqua_username='AQUA Console Email'
```

## Create a role

Add role definition as a `.yaml` file to `rbac/roles` directory:
```
---
role_name: example-role-1
description: Test Role created by Terraform
scopes:
  - scope-name-1
permissions: test-perm-set-1
```
Remember to create a permission set at the same time or use one that already exists

Scopes don't need to exist before creating a role, but the role wont work with a valid scope

## Add a Scope
Add scope definition as a `.yaml` file to `rbac/scopes` directory:
```
---
name: scope-name-1
description:  Test SCOPE created by Terraform
categories:
  - artifacts: 
    - image:
      - expression: "v1 && v2"
        variables:
        - attribute: aqua.registry
          value: test-registry
        - attribute: image.repo
          value: nginx
  - workloads:
    - kubernetes:
      - expression: "v1 && v2"
        variables:
        - attribute: kubernetes.cluster
          value: other
        - attribute: kubernetes.namespace
          value: some
  - infrastructure:
    - kubernetes:
      - expression: "v1"
        variables:
        - attribute: kubernetes.cluster
          value: other-cluster
```

## Add a Permission Set
Add permissons set definition as a `.yaml` file to `rbac/permission_sets` directory:

```
---
name: test-perm-set-1
description: Test Permissions Sets created by Terraform
ui_access: true #  Set False for API access only. API access is by default.
actions:
  - image_profiles.read
  - image_profiles.write            
  - network_policies.read
  - network_policies.write          
  - runtime_policies.read
  - runtime_policies.write
  - response_policies.read          
  - response_policies.write         
  - image_assurance.read
  - image_assurance.write
  - dashboard.read
  - dashboard.write                 
  - risk_explorer.read
  - images.read
  - images.write                    
  - risks.host_images.read
  - risks.host_images.write         
  - functions.read
  - functions.write                 
  - enforcers.read
  - enforcers.write                 
  - containers.read
  - services.read
  - services.write                  
  - infrastructure.read
  - infrastructure.write            
  - risks.vulnerabilities.read
  - risks.vulnerabilities.write
  - risks.benchmark.read
  - risks.benchmark.write           
  - audits.read
  - secrets.read
  - secrets.write                   
  - settings.read
  - settings.write                  
  - integrations.read
  - integrations.write              
  - registries_integrations.read
  - registries_integrations.write   
  - scan.read
  - gateways.read
```
