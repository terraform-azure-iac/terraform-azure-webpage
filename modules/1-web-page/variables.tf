variable "environment" {
    type      = string
    default   = ""
    description   = "test/stage/prod environment. This is set in .tfvars files"
}

variable "location" {
    type    = string
    default = "norwayeast"
}

variable "resource_group_name" {
    type  = string
    default = "web-page"
}

variable "keyvault_name" {
    type  = string
    default = "web-page-keyvault"
}

variable "vnet_name" {
    type  = string
    default = "web-page-vnet"
}

variable "vnet_address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_name" {
    type  = string
    default = "web-page-subnet"
}

variable "subnet_prefixes" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}

variable "subnet_name_gate" {
    type  = string
    default = "web-page-subnet-gateway"
}

variable "subnet_prefixes_gate" {
    type    = list(string)
    default = ["10.0.2.0/24"]
}



#CDN
variable "cdn_profile_name" {
    type        = string
    default     = "cdn-profile-ntnu-bachelor-22"
}

variable "cdn_endpoint_name" {
    type        = string
    default     = "cdn-endpoint-ntnu-bachelor-22"
}

variable "cdn_endpoint_origin_name" {
    type        = string
    default     = "cdn-endpoint-origin"
}

#Application Gateway
variable "application_gateway_name" {
    type        = string 
    default     = "application-gateway"
}

variable "application_gateway_sku_name" {
    type        = string 
    default     = "WAF_v2"
}

variable "application_gateway_sku_tier" {
    type        = string 
    default     = "WAF_v2"
}

variable "application_gateway_sku_capacity" {
    type        = number
    default     = 2
}

variable "application_gateway_gate_ip_config_name" {
    type        = string
    default     = "application-gateway-gateway"
}

variable "application_gateway_front_ip_config_name" {
    type        = string
    default     = "application-gateway-frontend"
}

variable "application_gateway_front_port_name" {
    type        = string
    default     = "application-gateway-frontend-port"
}

variable "application_gateway_backend_address_pool_name" {
    type        = string
    default     = "application-gateway-backend-address-pool"
}

variable "application_gateway_backend_http_settings_name" {
    type        = string
    default     = "application-gateway-backend-http-set"
}

variable "application_gateway_http_listner_name" {
    type        = string
    default     = "application-gateway-http-listner"
}

variable "application_gateway_req_rout_rule" {
    type        = string
    default     = "application-gateway-req-routing-rule"
}

variable "application_gateway_redirect_conf_name" {
    type        = string
    default     = "app-gateway-redirect-config"
}

#Web Application Firewall
#App Service
variable "app_service_plan_name" {
    type    = string
    default = "app-service-plan-web-page"
}

variable "app_service_plan_tier" {
    type    = string
    default = "Standard"
}

variable "app_service_plan_size" {
    type    = string
    default = "S1"
}

variable "app_service_name" {
    type    = string
    default = "app-service-web-page"
}

variable "app_service_name2" {
    type    = string
    default = "app-service-web-page2"
}

#Cache Redis
variable "redis_cache_name" {
    type    = string
    default = "redis-cache-web-page"
}

variable "redis_cache_capacity" {
    type    = number
    default = 2
}

variable "redis_cache_family" {
    type    = string
    default = "C"
}

variable "redis_cache_sku" {
    type    = string
    default = "Standard"
}


#Cosmmos DB
variable "cosmosdb_account_name" {
    type        = string
    default     = "cosmosdb-web-account"
}

variable "cosmosdb_sql_database_name" {
    type        = string
    default     = "Cosmosdb-sql"
}


#Container registry
variable "container_registry_name" {
    type    = string
    default = "WebPageContainerRegistry"
}