# Terraform Azure Webpage

## Info

This repository sets up infrastructure for hosting a web page or web application in Azure, with resources for monitoring, budget monitoring and security. 

<img src="/img/web-page-visio.png" alt="visio" style="zoom:50%;" />

ð¦case-small-business-webpage  <br/>
â£ ð [.github/](.github)  <br/>
â â ð [workflows/](.github/workflows)  <br/>
â â â£ ð [terraform-apply.yml](.github/workflows/terraform-apply.yml)  <br/>
â â â£ ð [terraform-destroy.yml](.github/workflows/terraform-destroy.yml)  <br/>
â â â£ ð [terraform-plan.yml](.github/workflows/terraform-plan.yml)  <br/>
â â â£ ð [terraform-tests.yml](.github/workflows/terraform-tests.yml)  <br/>
â â â ð [website-deploy.yml](.github/workflows/website-deploy.yml)  <br/>
â£ ð [img/](img)  <br/>
â£ ð [modules/](modules)  <br/>
â â£ ð [1-web-page/](modules/1-web-page)  <br/>
â â â£ ð [main.tf](modules/1-web-page/main.tf)  <br/>
â â â£ ð [output.tf](modules/1-web-page/output.tf)  <br/>
â â â£ ð [README.md](modules/1-web-page/README.md)  <br/>
â â â ð [variables.tf](modules/1-web-page/variables.tf)  <br/>
â â£ ð [2-budget/](modules/2-budget)  <br/>
â â â£ ð [main.tf](modules/2-budget/main.tf)  <br/>
â â â£ ð [output.tf](modules/2-budget/output.tf)  <br/>
â â â£ ð [README.md](modules/2-budget/README.md)  <br/>
â â â ð [variables.tf](modules/2-budget/variables.tf)  <br/>
â â£ ð [3-monitoring/](modules/3-monitoring)  <br/>
â â â£ ð [main.tf](modules/3-monitoring/main.tf)  <br/>
â â â£ ð [output.tf](modules/3-monitoring/output.tf)  <br/>
â â â£ ð [README.md](modules/3-monitoring/README.md)  <br/>
â â â ð [variables.tf](modules/3-monitoring/variables.tf)  <br/>
â â ð [4-security/](modules/4-security)  <br/>
â â â£ ð [main.tf](modules/4-security/main.tf)  <br/>
â â â£ ð [output.tf](modules/4-security/output.tf)  <br/>
â â â£ ð [README.md](modules/4-security/README.md)  <br/>
â â â ð [variables.tf](modules/4-security/variables.tf)  <br/>
â£ ð [src/](src)  <br/>
â â£ ð [index.html](src/index.html)  <br/>
â â£ ð [index.js](src/index.js)  <br/>
â â ð [styles.css](src/styles.css)  <br/>
â£ ð [.gitignore](.gitignore)  <br/>
â£ ð [.terraform.lock.hcl](.terraform.lock.hcl)  <br/>
â£ ð [backend.tf](backend.tf)  <br/>
â£ ð [backend_override.tf](backend_override.tf)  <br/>
â£ ð [main.tf](main.tf)  <br/>
â£ ð [output.tf](output.tf)  <br/>
â£ ð [README.md](README.md)  <br/>
â ð [variables.tf](variables.tf)  <br/>



## Prerequisites

#### Required Azure roles for user/service principal:

- **Contributor**: To provision resources
- **Key Vault Certificates Officer**: To perform actions on certificates in Key Vault
- **User Access Administrator**: Assign roles to resource identities (Assign "Key Vault Secrets User" to Application Gateway)



## Configure Module

- Do A to fit it to the needs of the user
- Do B to fit it to the needs of the user
- Do C to fit it to the needs of the user

---------------------------------------------

## Terraform documentation

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget"></a> [budget](modules/2-budget) | [./modules/2-budget](modules/2-budget) | n/a |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | [./modules/3-monitoring](modules/3-monitoring) | n/a |
| <a name="module_security"></a> [security](#module\_security) | [./modules/4-security](modules/4-security) | n/a |
| <a name="module_web-page"></a> [web-page](#module\_web-page) | [./modules/1-web-page](modules/1-web-page) | n/a |

### Resources

No resources.

### Inputs

No inputs.

### Outputs

No outputs.

