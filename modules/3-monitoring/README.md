# Monitoring


## Info/Intro
This module sets of monitoring on the resoruces in the environment. The module creates necessary resources for setting up monitoring for the environment. The module mostly consist of metrics to monitor, what should be classified as something to alert, and who to alert.


## How it works
- Monitor action, configuration for what and how alerts should be notified to the IT personel. Like epost and web hooks
- Monitor Alerts, these resources will create rules for specified resource metrics, and send out alert with the specified actions in monitor action.
- Monitor log alert, works mostly the same way as an alerts, but instead of alerting when the metric meats a specified criteria, it alerts when an event matching the specified conditions occure
- Monitor Log profile, set ups and configures the profile for logging of events.


## Usage
This module is mostly self sustaining, by depending on the different needs for a company. Other metric alerts, or log alerts should be added to meet their needs. The metrics included in the module now, is just an assumption from our group for which metrics/log alerts that might be intressting to follow. But adding more is an easy task, and if a resource is found not to be included, it is just to use one of the existing as a point of refrence. 

------------------------------------
## Terraform Documentation

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |



### Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_namespace.eventhub_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_log_analytics_solution.log_analytics_solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_action_group.monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_action_rule_action_group.action_rule_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_rule_action_group) | resource |
| [azurerm_monitor_activity_log_alert.monitor_activity_log_alert_nsg_cu](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_activity_log_alert.monitor_activity_log_alert_nsg_d](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_log_profile.monitor_log_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_log_profile) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_resource_group.monitoring](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_id"></a> [app\_service\_id](#input\_app\_service\_id) | n/a | `string` | `""` | no |
| <a name="input_application_gateway_id"></a> [application\_gateway\_id](#input\_application\_gateway\_id) | n/a | `string` | `""` | no |
| <a name="input_cdn_profile_id"></a> [cdn\_profile\_id](#input\_cdn\_profile\_id) | n/a | `string` | `""` | no |
| <a name="input_cosmos_id"></a> [cosmos\_id](#input\_cosmos\_id) | n/a | `string` | `""` | no |
| <a name="input_email_receiver_epost"></a> [email\_receiver\_epost](#input\_email\_receiver\_epost) | n/a | `string` | `"test@test.com"` | yes |
| <a name="input_email_receiver_name"></a> [email\_receiver\_name](#input\_email\_receiver\_name) | n/a | `string` | `"bachelor-ntnu-email"` | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | no |
| <a name="input_event_hub_receiver_name"></a> [event\_hub\_receiver\_name](#input\_event\_hub\_receiver\_name) | n/a | `string` | `"bachelor-ntnu-event-hub-receiver-name"` | yes |
| <a name="input_eventhub_message_retention"></a> [eventhub\_message\_retention](#input\_eventhub\_message\_retention) | n/a | `string` | `"7"` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `"eventhub-monitoring"` | yes |
| <a name="input_eventhub_namespace_capacity"></a> [eventhub\_namespace\_capacity](#input\_eventhub\_namespace\_capacity) | n/a | `number` | `1` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | EventHub | `string` | `"eventhub-namespace-monitoring"` | yes |
| <a name="input_eventhub_namespace_sku"></a> [eventhub\_namespace\_sku](#input\_eventhub\_namespace\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_eventhub_partition_count"></a> [eventhub\_partition\_count](#input\_eventhub\_partition\_count) | n/a | `string` | `"2"` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | n/a | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Log analytics workspace | `string` | `"log-analytics-workspace"` | yes |
| <a name="input_log_analytics_workspace_retention_days"></a> [log\_analytics\_workspace\_retention\_days](#input\_log\_analytics\_workspace\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Posible values: Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 | `string` | `"PerGB2018"` | no |
| <a name="input_monitor_action_group_name"></a> [monitor\_action\_group\_name](#input\_monitor\_action\_group\_name) | #### | `string` | `"monitor-action-group"` | yes |
| <a name="input_monitor_action_rule_action_group_name"></a> [monitor\_action\_rule\_action\_group\_name](#input\_monitor\_action\_rule\_action\_group\_name) | Action Rule | `string` | `"action-rule-group"` | yes |
| <a name="input_monitor_activity_log_alert_name_nsg_cu"></a> [monitor\_activity\_log\_alert\_name\_nsg\_cu](#input\_monitor\_activity\_log\_alert\_name\_nsg\_cu) | n/a | `string` | `"wb-nsg-create"` | yes |
| <a name="input_monitor_activity_log_alert_name_nsg_d"></a> [monitor\_activity\_log\_alert\_name\_nsg\_d](#input\_monitor\_activity\_log\_alert\_name\_nsg\_d) | n/a | `string` | `"wb-nsg-delete"` | yes |
| <a name="input_monitor_log_profile_categories"></a> [monitor\_log\_profile\_categories](#input\_monitor\_log\_profile\_categories) | n/a | `list(string)` | <pre>[<br>  "Action",<br>  "Delete",<br>  "Write"<br>]</pre> | no |
| <a name="input_monitor_log_profile_locations"></a> [monitor\_log\_profile\_locations](#input\_monitor\_log\_profile\_locations) | n/a | `list(string)` | <pre>[<br>  "norwayeast",<br>  "norwaywest"<br>]</pre> | no |
| <a name="input_monitor_log_profile_name"></a> [monitor\_log\_profile\_name](#input\_monitor\_log\_profile\_name) | Log Profile | `string` | `"monitor-log-profile"` | yes |
| <a name="input_monitor_metric_alert_name_ap"></a> [monitor\_metric\_alert\_name\_ap](#input\_monitor\_metric\_alert\_name\_ap) | n/a | `string` | `"metric-alert-app-service"` | no |
| <a name="input_monitor_metric_alert_name_kv"></a> [monitor\_metric\_alert\_name\_kv](#input\_monitor\_metric\_alert\_name\_kv) | n/a | `string` | `"metric-alert-keyvault"` | no |
| <a name="input_monitor_metric_alert_name_rc"></a> [monitor\_metric\_alert\_name\_rc](#input\_monitor\_metric\_alert\_name\_rc) | n/a | `string` | `"metric-alert-redis-cache"` | no |
| <a name="input_monitor_metric_alert_name_vn"></a> [monitor\_metric\_alert\_name\_vn](#input\_monitor\_metric\_alert\_name\_vn) | n/a | `string` | `"metric-alert-virtualnetwork"` | no |
| <a name="input_redis_cache_id"></a> [redis\_cache\_id](#input\_redis\_cache\_id) | n/a | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"monitoring-resource-group"` | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | n/a | `string` | `""` | no |
| <a name="input_webhook_receiver_name"></a> [webhook\_receiver\_name](#input\_webhook\_receiver\_name) | n/a | `string` | `"webhook-bachelor-ntnu-test"` | yes |
| <a name="input_webhook_receiver_uri"></a> [webhook\_receiver\_uri](#input\_webhook\_receiver\_uri) | n/a | `string` | `"https://example_webhook.com/123abc"` | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventhub_id"></a> [eventhub\_id](#output\_eventhub\_id) | n/a |
| <a name="output_log_analytic_workspace_id"></a> [log\_analytic\_workspace\_id](#output\_log\_analytic\_workspace\_id) | n/a |
| <a name="output_log_analytics_solution_id"></a> [log\_analytics\_solution\_id](#output\_log\_analytics\_solution\_id) | n/a |
| <a name="output_log_analytics_solution_workspace_resource_id"></a> [log\_analytics\_solution\_workspace\_resource\_id](#output\_log\_analytics\_solution\_workspace\_resource\_id) | n/a |





---------------------------------

## Resoruces