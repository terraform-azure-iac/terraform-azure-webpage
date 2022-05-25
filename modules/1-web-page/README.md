# Web Page


## Info/Intro
This module sets up ...


## How it works


## Usage

-----------------------------------------------
## Terraform documentation

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

### Resources

| Name | Type |
|------|------|
| [azurerm_app_service.website](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |
| [azurerm_app_service.website2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |
| [azurerm_app_service_plan.app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_slot.test_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_slot) | resource |
| [azurerm_application_gateway.application_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |
| [azurerm_cdn_endpoint.cdn_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_endpoint) | resource |
| [azurerm_cdn_profile.cdn_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_profile) | resource |
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_cosmosdb_account.cosmosdb_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_cosmosdb_sql_database.cosmosdb_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database) | resource |
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_certificate.key_vault_certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate) | resource |
| [azurerm_monitor_autoscale_setting.scale_app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_redis_cache.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.web_page](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.subnet_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_user_assigned_identity.user_assigned_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [random_integer.int](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | n/a | `string` | `"app-service-web-page"` | yes |
| <a name="input_app_service_name2"></a> [app\_service\_name2](#input\_app\_service\_name2) | n/a | `string` | `"app-service-web-page2"` | yes |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Web Application Firewall App Service | `string` | `"app-service-plan-web-page"` | yes |
| <a name="input_app_service_plan_size"></a> [app\_service\_plan\_size](#input\_app\_service\_plan\_size) | n/a | `string` | `"S1"` | no |
| <a name="input_app_service_plan_tier"></a> [app\_service\_plan\_tier](#input\_app\_service\_plan\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_application_gateway_backend_address_pool_name"></a> [application\_gateway\_backend\_address\_pool\_name](#input\_application\_gateway\_backend\_address\_pool\_name) | n/a | `string` | `"application-gateway-backend-address-pool"` | yes |
| <a name="input_application_gateway_backend_http_settings_name"></a> [application\_gateway\_backend\_http\_settings\_name](#input\_application\_gateway\_backend\_http\_settings\_name) | n/a | `string` | `"application-gateway-backend-http-set"` | yes |
| <a name="input_application_gateway_front_ip_config_name"></a> [application\_gateway\_front\_ip\_config\_name](#input\_application\_gateway\_front\_ip\_config\_name) | n/a | `string` | `"application-gateway-frontend"` | yes |
| <a name="input_application_gateway_front_port_name"></a> [application\_gateway\_front\_port\_name](#input\_application\_gateway\_front\_port\_name) | n/a | `string` | `"application-gateway-frontend-port"` | yes |
| <a name="input_application_gateway_gate_ip_config_name"></a> [application\_gateway\_gate\_ip\_config\_name](#input\_application\_gateway\_gate\_ip\_config\_name) | n/a | `string` | `"application-gateway-gateway"` | yes |
| <a name="input_application_gateway_http_listner_name"></a> [application\_gateway\_http\_listner\_name](#input\_application\_gateway\_http\_listner\_name) | n/a | `string` | `"application-gateway-http-listner"` | yes |
| <a name="input_application_gateway_name"></a> [application\_gateway\_name](#input\_application\_gateway\_name) | Application Gateway | `string` | `"application-gateway"` | yes |
| <a name="input_application_gateway_redirect_conf_name"></a> [application\_gateway\_redirect\_conf\_name](#input\_application\_gateway\_redirect\_conf\_name) | n/a | `string` | `"app-gateway-redirect-config"` | yes |
| <a name="input_application_gateway_req_rout_rule"></a> [application\_gateway\_req\_rout\_rule](#input\_application\_gateway\_req\_rout\_rule) | n/a | `string` | `"application-gateway-req-routing-rule"` | yes |
| <a name="input_application_gateway_sku_capacity"></a> [application\_gateway\_sku\_capacity](#input\_application\_gateway\_sku\_capacity) | n/a | `number` | `2` | no |
| <a name="input_application_gateway_sku_name"></a> [application\_gateway\_sku\_name](#input\_application\_gateway\_sku\_name) | n/a | `string` | `"WAF_v2"` | no |
| <a name="input_application_gateway_sku_tier"></a> [application\_gateway\_sku\_tier](#input\_application\_gateway\_sku\_tier) | n/a | `string` | `"WAF_v2"` | no |
| <a name="input_cdn_endpoint_name"></a> [cdn\_endpoint\_name](#input\_cdn\_endpoint\_name) | n/a | `string` | `"cdn-endpoint-ntnu-bachelor-22"` | yes |
| <a name="input_cdn_endpoint_origin_name"></a> [cdn\_endpoint\_origin\_name](#input\_cdn\_endpoint\_origin\_name) | n/a | `string` | `"cdn-endpoint-origin"` | yes |
| <a name="input_cdn_profile_name"></a> [cdn\_profile\_name](#input\_cdn\_profile\_name) | CDN | `string` | `"cdn-profile-ntnu-bachelor-22"` | yes |
| <a name="input_container_registry_name"></a> [container\_registry\_name](#input\_container\_registry\_name) | Container registry | `string` | `"WebPageContainerRegistry"` | yes |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Cosmmos DB | `string` | `"cosmosdb-web-account"` | yes |
| <a name="input_cosmosdb_sql_database_name"></a> [cosmosdb\_sql\_database\_name](#input\_cosmosdb\_sql\_database\_name) | n/a | `string` | `"Cosmosdb-sql"` | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | yes |
| <a name="input_keyvault_name"></a> [keyvault\_name](#input\_keyvault\_name) | n/a | `string` | `"web-page-keyvault"` | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_redis_cache_capacity"></a> [redis\_cache\_capacity](#input\_redis\_cache\_capacity) | n/a | `number` | `2` | no |
| <a name="input_redis_cache_family"></a> [redis\_cache\_family](#input\_redis\_cache\_family) | n/a | `string` | `"C"` | no |
| <a name="input_redis_cache_name"></a> [redis\_cache\_name](#input\_redis\_cache\_name) | Cache Redis | `string` | `"redis-cache-web-page"` | yes |
| <a name="input_redis_cache_sku"></a> [redis\_cache\_sku](#input\_redis\_cache\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"web-page"` | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | n/a | `string` | `"web-page-subnet"` | yes |
| <a name="input_subnet_name_gate"></a> [subnet\_name\_gate](#input\_subnet\_name\_gate) | n/a | `string` | `"web-page-subnet-gateway"` | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | n/a | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | yes |
| <a name="input_subnet_prefixes_gate"></a> [subnet\_prefixes\_gate](#input\_subnet\_prefixes\_gate) | n/a | `list(string)` | <pre>[<br>  "10.0.2.0/24"<br>]</pre> | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | n/a | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | n/a | `string` | `"web-page-vnet"` | yes |


### Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_id"></a> [app\_service\_id](#output\_app\_service\_id) | n/a |
| <a name="output_application_gateway_id"></a> [application\_gateway\_id](#output\_application\_gateway\_id) | n/a |
| <a name="output_cdn_profile_id"></a> [cdn\_profile\_id](#output\_cdn\_profile\_id) | n/a |
| <a name="output_cosmos_id"></a> [cosmos\_id](#output\_cosmos\_id) | n/a |
| <a name="output_id"></a> [id](#output\_id) | The Container Registry ID |
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | n/a |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The URL that can be used to log into the container registry. |
| <a name="output_redis_cache_id"></a> [redis\_cache\_id](#output\_redis\_cache\_id) | n/a |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_url"></a> [url](#output\_url) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |


----------------------------









------------------------------
## Resoruces