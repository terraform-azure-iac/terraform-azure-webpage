#General /Basics
resource "azurerm_resource_group" "web_page" {
    name        = "${var.resource_group_name}-${var.environment}"
    location    = var.location
}

data "azurerm_client_config" "current" {}

resource "random_integer" "int" {
    min     = 100
    max     = 999
}

resource "azurerm_key_vault" "keyvault" {
    name                       = var.keyvault_name
    location                   = var.location
    resource_group_name        = azurerm_resource_group.web_page.name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    enable_rbac_authorization  = true

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        certificate_permissions = [
            "Create",
            "Delete",
            "DeleteIssuers",
            "Get",
            "GetIssuers",
            "Import",
            "List",
            "ListIssuers",
            "ManageContacts",
            "ManageIssuers",
            "Purge",
            "SetIssuers",
            "Update",
        ]

        key_permissions = [
            "Backup",
            "Create",
            "Decrypt",
            "Delete",
            "Encrypt",
            "Get",
            "Import",
            "List",
            "Purge",
            "Recover",
            "Restore",
            "Sign",
            "UnwrapKey",
            "Update",
            "Verify",
            "WrapKey",
            ]

        secret_permissions = [
            "Backup",
            "Delete",
            "Get",
            "List",
            "Purge",
            "Recover",
            "Restore",
            "Set",
        ]
    }
}

resource "azurerm_key_vault_certificate" "key_vault_certificate" {
    name         = "generated-cert"
    key_vault_id = azurerm_key_vault.keyvault.id

    certificate_policy {
        issuer_parameters {
            name = "Self"
        }

        key_properties {
            #curve      = "P-521"
            exportable = true
            key_size   = 4096
            key_type   = "RSA"
            reuse_key  = true
        }

        lifetime_action {
            action {
                action_type = "AutoRenew"
            }

            trigger {
                days_before_expiry = 30
            }
        }

        secret_properties {
            content_type = "application/x-pkcs12"
        }

        x509_certificate_properties {
            # Server Authentication = 1.3.6.1.5.5.7.3.1
            # Client Authentication = 1.3.6.1.5.5.7.3.2
            extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

            key_usage = [
                "cRLSign",
                "dataEncipherment",
                "digitalSignature",
                "keyAgreement",
                "keyCertSign",
                "keyEncipherment",
            ]

            # subject nned to contain the domain
            # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_certificate
            # App Service Domain
            # app service certificate
            # Azure AD Domain Services
            #Subject should be the domain of the web page
            subject             = "CN=${azurerm_app_service.website.default_site_hostname}"    ####################################
            validity_in_months = 12
        }
    }
}

# Give Application Gatway permission to read certificate from Key Vault
resource "azurerm_user_assigned_identity" "user_assigned_id" {
    name                = "application-gateway"
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
}

resource "azurerm_role_assignment" "example" {
    scope              = azurerm_key_vault.keyvault.id
    role_definition_name = "Key Vault Secrets User"
    principal_id       = azurerm_user_assigned_identity.user_assigned_id.principal_id
}

# Network
resource "azurerm_virtual_network" "vnet" {
    name                    = var.vnet_name
    location                = var.location
    resource_group_name     = azurerm_resource_group.web_page.name
    address_space           = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
    name                    = var.subnet_name
    resource_group_name     = azurerm_resource_group.web_page.name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefixes        = var.subnet_prefixes
}

resource "azurerm_subnet" "subnet_gateway" {
    name                    = var.subnet_name_gate
    resource_group_name     = azurerm_resource_group.web_page.name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefixes        = var.subnet_prefixes_gate
}

resource "azurerm_public_ip" "public_ip" {
    name                = "public-ip-application-gateway"
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
    allocation_method   = "Static"
    sku                 = "Standard"
}

# CDN
resource "azurerm_cdn_profile" "cdn_profile" {
    name                  = var.cdn_profile_name
    location              = "northeurope"
    resource_group_name   = azurerm_resource_group.web_page.name
    sku                   = "Standard_Verizon"

}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
    name                  = var.cdn_endpoint_name
    profile_name          = azurerm_cdn_profile.cdn_profile.name
    location              = "northeurope"
    resource_group_name   = azurerm_resource_group.web_page.name
    is_http_allowed       = false

    #Host name is the name of the service using the enpoint (App service) 
    origin {
        name        = var.cdn_endpoint_origin_name
        host_name   = azurerm_app_service.website.default_site_hostname                    ###########################
    }
}


#Application Gateway
resource "azurerm_application_gateway" "application_gateway" {
    name                    = var.application_gateway_name
    location                = var.location
    resource_group_name     = azurerm_resource_group.web_page.name

    sku {
        name        = var.application_gateway_sku_name
        tier        = var.application_gateway_sku_tier
        capacity    = var.application_gateway_sku_capacity
    }
    
    gateway_ip_configuration {
        name        = var.application_gateway_gate_ip_config_name
        subnet_id   = azurerm_subnet.subnet_gateway.id
    }
    
    frontend_ip_configuration {
        name                  = var.application_gateway_front_ip_config_name
        public_ip_address_id  = azurerm_public_ip.public_ip.id
    }
    frontend_port {
        name        = var.application_gateway_front_port_name
        port        = 443
    }

    backend_address_pool {
        name    = var.application_gateway_backend_address_pool_name
        fqdns   = [azurerm_app_service.website.default_site_hostname, azurerm_app_service.website2.default_site_hostname]
    }
    
    backend_http_settings {
        name                    = var.application_gateway_backend_http_settings_name
        cookie_based_affinity   = "Disabled"
        #path                    =
        port                    = 443
        protocol                = "Https"
        request_timeout         = "300"
        #probe_name              = 
    } 
    
    ssl_certificate {
        name                = azurerm_key_vault_certificate.key_vault_certificate.name
        key_vault_secret_id = azurerm_key_vault_certificate.key_vault_certificate.secret_id
        #key_vault_secret_id = azurerm_key_vault_secret.keyvault_secret.id
        #key_vault_secret_id = azurerm_key_vault_certificate.mysite1.secret_id
        #data                = azurerm_key_vault_certificate.key_vault_certificate.certificate_data
        #password            = 
    }
    
    identity {
        type            = "UserAssigned" 
        identity_ids    = [azurerm_user_assigned_identity.user_assigned_id.id]
    }

    http_listener {
        name                            = var.application_gateway_http_listner_name
        frontend_ip_configuration_name  = var.application_gateway_front_ip_config_name
        frontend_port_name              = var.application_gateway_front_port_name
        protocol                        = "Https"
        ssl_certificate_name            = azurerm_key_vault_certificate.key_vault_certificate.name
    }

    request_routing_rule {
        name                        = var.application_gateway_req_rout_rule
        rule_type                   = "Basic"
        http_listener_name          = var.application_gateway_http_listner_name
        backend_address_pool_name   = var.application_gateway_backend_address_pool_name
        backend_http_settings_name  = var.application_gateway_backend_http_settings_name
    }

    waf_configuration {
        enabled                     = true
        firewall_mode               = "Prevention"
        rule_set_type               = "OWASP"
        rule_set_version            = 3.2
        request_body_check          = true
    }
}


#App Service
resource "azurerm_app_service_plan" "app_service_plan" {
    name                    = var.app_service_plan_name
    location                = var.location
    resource_group_name     = azurerm_resource_group.web_page.name
    kind                    = "Windows"

    sku {
        tier    = var.app_service_plan_tier
        size    = var.app_service_plan_size

    }
}

resource "azurerm_app_service" "website" {
    name                = "${var.app_service_name}-windows-website"
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
    app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

    app_settings = {
        WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
        WEBSITE_DYNAMIC_CACHE = 0
        WEBSITE_LOCAL_CACHE_OPTION = "Never"
    }
# trengs denne?
    identity {  
        type = "SystemAssigned"
    } 
#    depends_on = [azurerm_container_registry.acr, ]  
}

resource "azurerm_app_service" "website2" {
    name                = "${var.app_service_name2}-windows-website"
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
    app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

    app_settings = {
        WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
        WEBSITE_DYNAMIC_CACHE = 0
        WEBSITE_LOCAL_CACHE_OPTION = "Never"
    }
# trengs denne?
    identity {  
        type = "SystemAssigned"
    } 
#    depends_on = [azurerm_container_registry.acr, ]  
}


resource "azurerm_app_service_slot" "test_slot" { # test_slot
  #name                = "${var.app_service_name}-windows-website-slot1"
  name                = "test-slot"
  app_service_name    = azurerm_app_service.website.name
  location            = azurerm_resource_group.web_page.location
  resource_group_name = azurerm_resource_group.web_page.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

    app_settings = {
        WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
        WEBSITE_DYNAMIC_CACHE = 0
        WEBSITE_LOCAL_CACHE_OPTION = "Never"
    }
    identity {
        type = "SystemAssigned"
    }
}



resource "azurerm_container_registry" "acr" {
    name                = var.container_registry_name
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
    sku                 = "Standard"
    admin_enabled       = false

}


# resource "azurerm_service_plan" "linuxplan" {
#   name                = "linuxplan"
#   resource_group_name = azurerm_resource_group.web_page.name
#   location            = var.location
#   os_type             = "Linux"
#   sku_name            = "P1v2"
# }

# resource "azurerm_linux_web_app" "website" {
#     name                = "${var.app_service_name}-linux-website"
#     location            = var.location
#     resource_group_name = azurerm_resource_group.web_page.name
#     service_plan_id = azurerm_service_plan.linuxplan.id

#     depends_on = [azurerm_container_registry.acr, azurerm_service_plan.linuxplan]  
# }


#Cache Redis
resource "azurerm_redis_cache" "redis_cache" {
    name                = var.redis_cache_name
    location            = var.location
    resource_group_name = azurerm_resource_group.web_page.name
    capacity            = var.redis_cache_capacity
    family              = var.redis_cache_family
    sku_name            = var.redis_cache_sku
    minimum_tls_version = "1.2"
    redis_version       = 6
    #Connect to network?
    #"subnet id = ..." if using a premium version or use a private endpoint.
}

#Cosmmos DB
resource "azurerm_cosmosdb_account" "cosmosdb_account" {
    name                  = "${var.cosmosdb_account_name}-${random_integer.int.result}"
    location              = var.location
    resource_group_name   = azurerm_resource_group.web_page.name
    offer_type            = "Standard"
    
    consistency_policy {
        consistency_level         = "BoundedStaleness"
        max_interval_in_seconds   = 300
        max_staleness_prefix      = 100000
    }

    geo_location {
        location            = var.location
        failover_priority   = 0
    }   

    backup {
        type                  = "Periodic"
        interval_in_minutes   = 240
        retention_in_hours    = 12
        storage_redundancy    = "Local"
    }
    /*
    is_virtual_network_filter_enabled = true
    virtual_network_rule {
        id = 
        ignore_missing_vnet_service_endpoint = true
    }   
    */
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql_database" {
    name                  = var.cosmosdb_sql_database_name
    resource_group_name   = azurerm_resource_group.web_page.name
    account_name          = azurerm_cosmosdb_account.cosmosdb_account.name
    throughput            = 400
}


# Autoscaling of App Service (scaling out/in based on cpu usage)
resource "azurerm_monitor_autoscale_setting" "scale_app_service" {
  name                = "${var.app_service_plan_name}-autoscale"
  resource_group_name = azurerm_resource_group.web_page.name
  location            = azurerm_resource_group.web_page.location
  target_resource_id  = azurerm_app_service_plan.app_service_plan.id

  profile {
    name = "defaultProfile"

    capacity {
      default = 1
      minimum = 1
      maximum = 3
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_app_service_plan.app_service_plan.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "Microsoft.Web/serverfarms"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = azurerm_app_service_plan.app_service_plan.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }

  notification {
    email {
      send_to_subscription_administrator    = false
      send_to_subscription_co_administrator = false
      custom_emails                         = ["test@test.com"]
    }
  }
}