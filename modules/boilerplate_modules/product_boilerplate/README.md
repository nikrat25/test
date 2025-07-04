# Terragrunt scaffold to boilerplating

# Local Boilerplate commands
Boilerplate is very similar to cookiecutter, and uses go templates:
```sh
-- with boilerplate 
boilerplate --template-url modules/product_boilerplate/.boilerplate --output-folder instantiate --var-file variables/vars.yml
```
# Local terragrunt commands

Terragrunt was made by the same company as boilerplate (gruntwork) and automatically looks for a `.boilerplate` directory when it scaffolds modules. If terragrunt finds a `.boilerplate` directory, then uses boilerplate to scaffold this file. In this case, the terraform module being scaffolded no longer matters.

```sh
-- with terragrunt
terragrunt scaffold modules//product_boilerplate --var-file variables/vars.yml
```
Currently, must perform the relevant path to the boilerplate module
There is a  [pending pr with terragrunt](https://github.com/gruntwork-io/terragrunt/pull/3805) for an output-dir argument.
# Remote terragrunt commands
If developing in the `petcare-pdap-core` repo.<br>
```sh
-- with terragrunt
terragrunt scaffold git@ssh.dev.azure.com:v3/marsanalytics/Pet%20Nutrition%20Data%20and%20Analytics%20DNA/PN-DNA-PDAP-RG//modules//product_boilerplate?ref={relevant_tag_or_branch} --var-file variables/vars.yml
```

Or, alternatively:
```sh
-- with terragrunt
terragrunt catalog git@ssh.dev.azure.com:v3/marsanalytics/Pet%20Nutrition%20Data%20and%20Analytics%20DNA/PN-DNA-PDAP-RG/?ref={relevant_tag_or_branch}
```
Terragrunt scaffold allows one to use a TUI (terminal user interface) to fill out the for the cluster.
With terragrunt scaffold, the product **must** be in `modules` directory of the repository.