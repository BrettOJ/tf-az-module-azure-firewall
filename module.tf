resource "azurerm_firewall" "azure_firewall" {
    name                = module.azfw_name.naming_convention_output[var.naming_convention_info.name].names.0
    resource_group_name = var.resource_group_name
    location            = var.location
    sku_name = var.sku_name
    sku_tier = var.sku_tier
    zones               = var.zones
    tags                = var.tags
    threat_intel_mode   = var.threat_intel_mode
    private_ip_ranges   = var.private_ip_ranges
    dns_proxy_enabled   = var.dns_proxy_enabled
    dns_servers         = var.dns_servers
    firewall_policy_id  = var.firewall_policy_id
    
    ip_configuration {
        name                 = var.ip_configuration.name
        subnet_id            = var.ip_configuration.subnet_id
        public_ip_address_id = var.ip_configuration.public_ip_address_id
    }
    dynamic management_ip_configuration {
        for_each = var.management_ip_configuration != null ? [1] : []
        content {
        name                 = var.management_ip_configuration.name
        subnet_id            = var.management_ip_configuration.subnet_id
        public_ip_address_id = var.management_ip_configuration.public_ip_address_id
    }
    }
    dynamic virtual_hub {
        for_each = var.virtual_hub != null ? [1] : []
        content {
            virtual_hub_id   = var.virtual_hub.virtual_hub_id
            public_ip_count  = var.virtual_hub.public_ip_count
        }
    }
}