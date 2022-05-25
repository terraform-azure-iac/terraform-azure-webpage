# Security


## Info/Intro

This module configures the firste time need for getting stareted with the defender for cloud. The module will activate the neccessary subscription configuration's, and also set up a simple solution for the sentinel functionality in Azure


## How it works

- A simple activation for Defender for cloud and the different subscription settings that should be active.
- When defender for cloud is active, it will monitor the resources specified in the subscription. Alert when something is wrong, and give you an easy to use interface with the overall security and compliance for your environment
- Get the log analytic functionality from the monitoring module, to set up sentinel in the right resource group. And then connect the services that terraform allows.



## Usage
- Defender for cloud is quite low maintenence, but when getting an alert, the defender gui interface will be very usefull to understand for the personel responsible for events/secuirty.
- Sentinel is kinda of an cloud native SIEM solution, that will help the IT personell to detect, investigate and respond to incidents. The setup for Sentinel is not easily done with terraform, so some personell with some experience in the field should configure sentinel and utilize the prexsisting resources in "Sentinel Content hub", additional workboks or/and data connectors for relevant services.


------------------------------------
## Terraform Documentation

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


### Resources

| Name | Type |
|------|------|
| [azurerm_security_center_contact.security_center_contact](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_contact) | resource |
| [azurerm_security_center_subscription_pricing.security_center_subscription_pricing_as](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_subscription_pricing.security_center_subscription_pricing_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_subscription_pricing.security_center_subscription_pricing_sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_subscription_pricing.security_center_subscription_pricing_ss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_workspace.name](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_workspace) | resource |
| [azurerm_sentinel_alert_rule_fusion.sentinel_alert_rule_fusion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_fusion) | resource |
| [azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.sentinel_alert_machine_learning](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_machine_learning_behavior_analytics) | resource |
| [azurerm_sentinel_alert_rule_ms_security_incident.sentinel_alert_rule_ms_security_incident](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_ms_security_incident) | resource |
| [azurerm_sentinel_data_connector_azure_security_center.sentinel_data_connector_azure_security_center](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_security_center) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytic_workspace_id"></a> [log\_analytic\_workspace\_id](#input\_log\_analytic\_workspace\_id) | n/a | `string` | `""` | no |
| <a name="input_log_analytics_solution_id"></a> [log\_analytics\_solution\_id](#input\_log\_analytics\_solution\_id) | n/a | `string` | `""` | no |
| <a name="input_log_analytics_solution_workspace_resource_id"></a> [log\_analytics\_solution\_workspace\_resource\_id](#input\_log\_analytics\_solution\_workspace\_resource\_id) | n/a | `string` | `""` | no |
| <a name="input_security_center_contact_email"></a> [security\_center\_contact\_email](#input\_security\_center\_contact\_email) | Change depending on main contact for security/events | `string` | `"test@test.com"` | yes |
| <a name="input_security_center_contact_phone"></a> [security\_center\_contact\_phone](#input\_security\_center\_contact\_phone) | For setting the phone number to the contact person for the Defender for cloud | `string` | `"+47-12345678"` | yes |
| <a name="input_sentienl_watchlist_item_name"></a> [sentienl\_watchlist\_item\_name](#input\_sentienl\_watchlist\_item\_name) | n/a | `string` | `"0aac6fa5-223e-49cf-9bfd-3554dc9d2b76"` | no |
| <a name="input_sentienl_watchlist_name"></a> [sentienl\_watchlist\_name](#input\_sentienl\_watchlist\_name) | n/a | `string` | `"sentinel_watchlist_wp"` | yes |
| <a name="input_sentinel_alert_machine_learning_name"></a> [sentinel\_alert\_machine\_learning\_name](#input\_sentinel\_alert\_machine\_learning\_name) | n/a | `string` | `"wp-sentinel-machinelearning"` | yes |
| <a name="input_sentinel_alert_rule_fusion_name"></a> [sentinel\_alert\_rule\_fusion\_name](#input\_sentinel\_alert\_rule\_fusion\_name) | n/a | `string` | `"wp-fusion"` | yes |
| <a name="input_sentinel_alert_rule_ms_security_incident_name"></a> [sentinel\_alert\_rule\_ms\_security\_incident\_name](#input\_sentinel\_alert\_rule\_ms\_security\_incident\_name) | n/a | `string` | `"wp-ms-incident"` | yes |
| <a name="input_sentinel_data_connector_azure_security_center_name"></a> [sentinel\_data\_connector\_azure\_security\_center\_name](#input\_sentinel\_data\_connector\_azure\_security\_center\_name) | n/a | `string` | `"security-center-connector"` | yes |



------------------------------------------------

## Resoruces