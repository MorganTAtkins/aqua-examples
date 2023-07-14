# aqua-examples

terraform apply -var aqua_password='******' -var aqua_username='AQUA Console Email'

## Create a role

Add role definition to ROLEs in the workspace of choice:
```

  test-role-1:
    description: Test Permissions Sets created by Terraform
    scopes:
      - test-scope 
    permissions: test-perm-set
```
Remember to create a permission set at the same time or use one that already exists

Scopes don't need to exist before creating a role, but the role wont work with a valid scope

## Add a Scope

Add a scope to the SCOPES definition in the workspace of choice:
```
- name: test-scope-1
    description:  Test SCOPE created by Terraform
    artifacts: 
      - image:
        - expression: "v1 && v2"
          variables:
          - attribute: aqua.registry
            value: test-registry
          - attribute: image.repo
            value: nginx
    workloads:
      - kubernetes:
        - expression: "v1 && v2"
          variables:
          - attribute: kubernetes.cluster
            value: other
          - attribute: kubernetes.namespace
            value: some
    infrastructure:
      - kubernetes:
        - expression: "v1"
          variables:
          - attribute: kubernetes.cluster
            value: other-cluster
```

## Add a Permission Set

Add a scope to the PERMSET definition in the workspace of choice:

```
  test-perm-set:
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
      ...
```