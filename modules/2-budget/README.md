# Budget Monitoring



## Info / intro

This module sets up monitoring of of the amount of financial means used by the resources. It monitors both on Subscritpion and Resource group level. This will check the amount used the the subscription and resource group and notify the user when an set amount is reached or the forcasted cost is greater than the amount set. Forcasted cost is the expected cost for the time period. 



### How it works:
- An action group is created with the details and information of the persons and places (webhooks to Teams, Azure DevOps or other similar solutions or a shared email account) that will be notified.
- consumption budget for the subscription that monitors the money spent/expected to be spent for the subscription. This will send notifications using the action group when specified levels is reached.
- consumption budget for the resource group that monitors the money spent/expected to be spent of the resources group. This will send notifications using the action group when specified levels is reached.

------------------------------------
## Terraform Documentation

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


### Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_resource_group.consumption_budget_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |
| [azurerm_consumption_budget_subscription.consumption_budget_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_monitor_action_group.monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_resource_group.budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | monitor action group | `string` | `"monitor-action-group"` | yes |
| <a name="input_action_group_short_name"></a> [action\_group\_short\_name](#input\_action\_group\_short\_name) | n/a | `string` | `"budget-mon"` | yes |
| <a name="input_consumption_budget_resource_group_amount"></a> [consumption\_budget\_resource\_group\_amount](#input\_consumption\_budget\_resource\_group\_amount) | n/a | `number` | `100` | yes |
| <a name="input_consumption_budget_resource_group_name"></a> [consumption\_budget\_resource\_group\_name](#input\_consumption\_budget\_resource\_group\_name) | consumption budget resource group | `string` | `"consumption-budget-resource-group"` | yes |
| <a name="input_consumption_budget_resource_group_time_grain"></a> [consumption\_budget\_resource\_group\_time\_grain](#input\_consumption\_budget\_resource\_group\_time\_grain) | n/a | `string` | `"Monthly"` | no |
| <a name="input_consumption_budget_resource_group_time_period"></a> [consumption\_budget\_resource\_group\_time\_period](#input\_consumption\_budget\_resource\_group\_time\_period) | n/a | `list` | <pre>[<br>  "2022-05-01T00:00:00Z",<br>  "2023-01-01T00:00:00Z"<br>]</pre> | yes |
| <a name="input_consumption_budget_subscription_amount"></a> [consumption\_budget\_subscription\_amount](#input\_consumption\_budget\_subscription\_amount) | n/a | `number` | `250` | yes |
| <a name="input_consumption_budget_subscription_name"></a> [consumption\_budget\_subscription\_name](#input\_consumption\_budget\_subscription\_name) | consumption budget subscription | `string` | `"consumption-budget-subscription"` | yes |
| <a name="input_consumption_budget_subscription_time_grain"></a> [consumption\_budget\_subscription\_time\_grain](#input\_consumption\_budget\_subscription\_time\_grain) | n/a | `string` | `"Monthly"` | no |
| <a name="input_consumption_budget_subscription_time_period"></a> [consumption\_budget\_subscription\_time\_period](#input\_consumption\_budget\_subscription\_time\_period) | n/a | `list` | <pre>[<br>  "2022-05-01T00:00:00Z",<br>  "2023-01-01T00:00:00Z"<br>]</pre> | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_reciver"></a> [reciver](#input\_reciver) | n/a | <pre>list(object({<br>        name                    = string<br>        email_address           = string<br>        country_code            = string<br>        phone_number            = string<br>        use_common_alert_schema = bool<br>    }))</pre> | <pre>[<br>  {<br> 
   "country_code": "47",<br>    "email_address": "employee1@yeet.no",<br>    "name": "Employee Name 1",<br>    "phone_number": "11111111",<br>    "use_common_alert_schema": true<br>  },<br>  {<br>    "country_code": "47",<br>    "email_address": "employee2@yeet.no",<br>    "name": "Employee Name 2",<br>    "phone_number": "111111112",<br>    "use_common_alert_schema": true<br>  }<br>]</pre> | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"budget-monitoring"` | yes |
| <a name="input_web_page_resource_group_id"></a> [web\_page\_resource\_group\_id](#input\_web\_page\_resource\_group\_id) | ################################# Variables from other modules | `string` | `""` | no |
| <a name="input_webhook_reciver_name"></a> [webhook\_reciver\_name](#input\_webhook\_reciver\_name) | n/a | `string` | `"budget-webhook"` | yes |
| <a name="input_webhook_reciver_uri"></a> [webhook\_reciver\_uri](#input\_webhook\_reciver\_uri) | n/a | `string` | `"https://example_webhook.com/123abc"` | no |







---------------------------------------


## Resources

<!--- - Name of each resource in the module (links to documentation), what it does in this module --->
- Action Group is a group of notifaction settings, that specifies what/who should receive a notification. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups
- Consumption budget sets a budget in Azure, either for a resource group or a subscription. It is set for a time period and a given amount for a month, quarter or year. Both actual and forcated/expected cost for the period can be mesured. It send out a notification to a specified reciver (an action group or other manualy set recivers) based on the cost reaching a given threshold. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription








## Usage





## References

- . 
- . 

