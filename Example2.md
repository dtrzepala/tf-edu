## Example 2

### Remarks

- example 2 covers
  - backend
  - handling more resources
  - splitting to separate files
  - use of variables
  - use of outputs
  - loops
  - where to look for documentation

### Steps

1. There might be different backend storages but for this example we will use azure storage. It's probably the only resource you create manually for the project. Also, it needs to be protected with proper permissions so not everybody has access to it.
   1. create resource group e.g. `rg-tfbackend`
   2. create azure storage account `stterraformfisexamples{yourname}`(must be globally unique) with blob container e.g. `states`
   3. modify `storage_account_name` to match your storage account name
   4. run `terraform init`. The state file with the key specified in the backend.tf file should be created.
2. Add resources resource groups, storage, app service (see next commit).
   1. run `terraform apply`. See that even though it's all in separate files, sometimes referencing each other from different files.
   2. see merge command
   3. reuse of already set parameters (tags, merge - collection func)
3. Make use of variables
   1. let's define separate file for defining variables - `variables.tf` - although they can be added in any file as well.
   2. run apply with extra file providing the variable value<br>
   `terraform apply -var-file="vars/test.tfvars" `
   3. see analysed plan.
   4. as you can see this is convenient way for reusing infrastructure configuration in multi-tenant systems or through different stages 