module "web-page" {
    source      = "./modules/1-web-page"
    environment = var.environment     
}

module "budget" {
    source                       = "./modules/2-budget"
    environment                  = var.environment 
    web_page_resource_group_id   = module.web-page.resource_group_id
}

module "monitoring" {
    source      = "./modules/3-monitoring"
    environment = var.environment  

    keyvault_id             = module.web-page.keyvault_id
    vnet_id                 = module.web-page.vnet_id
    cdn_profile_id          = module.web-page.cdn_profile_id
    application_gateway_id  = module.web-page.application_gateway_id
    app_service_id          = module.web-page.app_service_id
    redis_cache_id          = module.web-page.redis_cache_id
    cosmos_id               = module.web-page.cosmos_id

    #resources/variables sent from other modules 
}



module "security" {
    source = "./modules/4-security"

    log_analytic_workspace_id = module.monitoring.log_analytic_workspace_id
    log_analytics_solution_id = module.monitoring.log_analytics_solution_id
    log_analytics_solution_workspace_resource_id = module.monitoring.log_analytics_solution_workspace_resource_id
}
