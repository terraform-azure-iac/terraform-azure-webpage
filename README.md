# Terraform Azure Webpage

## Info

This repository sets up infrastructure for hosting a web page or web application in Azure, with resources for monitoring, budget monitoring and security. 

<img src="/img/web-page-visio.png" alt="visio" style="zoom:50%;" />

📦case-small-business-webpage  <br/>
┣ 📂 [.github/](.github)  <br/>
┃ ┗ 📂 [workflows/](.github/workflows)  <br/>
┃ ┃ ┣ 📜 [terraform-apply.yml](.github/workflows/terraform-apply.yml)  <br/>
┃ ┃ ┣ 📜 [terraform-destroy.yml](.github/workflows/terraform-destroy.yml)  <br/>
┃ ┃ ┣ 📜 [terraform-plan.yml](.github/workflows/terraform-plan.yml)  <br/>
┃ ┃ ┣ 📜 [terraform-tests.yml](.github/workflows/terraform-tests.yml)  <br/>
┃ ┃ ┗ 📜 [website-deploy.yml](.github/workflows/website-deploy.yml)  <br/>
┣ 📂 [img/](img)  <br/>
┣ 📂 [modules/](modules)  <br/>
┃ ┣ 📂 [1-web-page/](modules/1-web-page)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/1-web-page/main.tf)  <br/>
┃ ┃ ┣ 📜 [output.tf](modules/1-web-page/output.tf)  <br/>
┃ ┃ ┣ 📜 [README.md](modules/1-web-page/README.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/1-web-page/variables.tf)  <br/>
┃ ┣ 📂 [2-budget/](modules/2-budget)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/2-budget/main.tf)  <br/>
┃ ┃ ┣ 📜 [output.tf](modules/2-budget/output.tf)  <br/>
┃ ┃ ┣ 📜 [README.md](modules/2-budget/README.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/2-budget/variables.tf)  <br/>
┃ ┣ 📂 [3-monitoring/](modules/3-monitoring)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/3-monitoring/main.tf)  <br/>
┃ ┃ ┣ 📜 [output.tf](modules/3-monitoring/output.tf)  <br/>
┃ ┃ ┣ 📜 [README.md](modules/3-monitoring/README.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/3-monitoring/variables.tf)  <br/>
┃ ┗ 📂 [4-security/](modules/4-security)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/4-security/main.tf)  <br/>
┃ ┃ ┣ 📜 [output.tf](modules/4-security/output.tf)  <br/>
┃ ┃ ┣ 📜 [README.md](modules/4-security/README.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/4-security/variables.tf)  <br/>
┣ 📂 [src/](src)  <br/>
┃ ┣ 📜 [index.html](src/index.html)  <br/>
┃ ┣ 📜 [index.js](src/index.js)  <br/>
┃ ┗ 📜 [styles.css](src/styles.css)  <br/>
┣ 📜 [.gitignore](.gitignore)  <br/>
┣ 📜 [.terraform.lock.hcl](.terraform.lock.hcl)  <br/>
┣ 📜 [backend.tf](backend.tf)  <br/>
┣ 📜 [backend_override.tf](backend_override.tf)  <br/>
┣ 📜 [main.tf](main.tf)  <br/>
┣ 📜 [output.tf](output.tf)  <br/>
┣ 📜 [README.md](README.md)  <br/>
┗ 📜 [variables.tf](variables.tf)  <br/>



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

