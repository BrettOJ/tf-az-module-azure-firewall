

locals {
  tags = {
    "created-by" = "Terraform"

  }

  naming_convention_info = {
    name         = "001"
    project_code = "knj"
    env          = "dev"
    zone         = "z1"
    agency_code  = "konjur"
    tier         = "dta"
  }

}

module "azure_firewall" {
    source = "../"
    resource_group_name = var.resource_group_name
    location            = var.location
    sku_name = var.sku_name
    sku_tier = var.sku_tier
    zones               = var.zones
    tags                = local.tags
    naming_convention_info = local.naming_convention_info
    threat_intel_mode   = var.threat_intel_mode
    private_ip_ranges   = var.private_ip_ranges
    dns_proxy_enabled   = var.dns_proxy_enabled
    dns_servers         = var.dns_servers
    firewall_policy_id  = var.firewall_policy_id


    ip_configuration = {
        name                 = var.ip_configuration_name
        subnet_id            = var.ip_configurations_subnet_id
        public_ip_address_id = var.ip_configuration_public_ip_address_id
    }
    management_ip_configuration = {
        name                 = var.management_ip_configuration_name
        subnet_id            = var.management_ip_configuration_subnet_id
        public_ip_address_id = var.management_ip_configuration_public_ip_address_id
    }
    virtual_hub = {
        virtual_hub_id   = var.virtual_hub_virtual_hub_id
        public_ip_count  = var.virtual_hub_public_ip_count
    }

}

