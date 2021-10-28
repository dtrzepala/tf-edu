## Example 1

### Remarks

- Keep your system infrastructure in the repository.
  - check in `.terraform.lock.hcl` so everyone is using the same version of providers
  - `.terraform` directory should be ignored from version control
  
### Steps

- Root module (inside the "Example1" directory)
  - usually where you run `terraform init`
  - it is only required module
  - most often for terraform files you will use `.tf` extension
  - running terraform build graph of the infrastructure, therefore you can organize the file structure almost freely. **USE IT FOR READABILITY**, exactly as with any source code you typically write.
    - `main.tf` as entry point to the application
    
1. In this example look how configuration is kept in single file (main.tf)
   1. provider, 
   2. lack of specified backend, 
   3. resource group
2. For interactive use case do authenticate with az cli. (for non-interactive usually you will want to create service principal and provide credentials with environment variables)
    - remark: say about service principal vars
    - use command `az login`. This will open browser and allow you to login.
    - see `az accounts list`, you should have there listed your subscription.
3. Run `terraform init` to initialize download providers, modules and initialize state.
4. Run `terraform plan`. <br>You should see what is to be created/updated/destroyed
   1. terraform calculates graph of resources, so it knows in which order to create all the resources to satisfy dependencies
5. Run `terraform apply`.<br> This command consists of 2 stages - plan(1) after which you need to approve appliance(2) of the calculated plan.
6. Modify something
   1. Add some tags for created resource group <br>
   <pre>
   tags = {
      Terraform   = "true" 
      Environment = "test"
   }
   </pre>
   It is good practice to tag resources with attributes that make it easier to group/query/etc.
   2. run again `terraform apply`
7. Run `terraform destroy`. <br>Always remember to clean up after any tests, exercises, whatever you do not intend to keep, so to not run into troubles with extra billing for not wanted usage of created resources.