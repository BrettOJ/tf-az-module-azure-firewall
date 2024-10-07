# Varialbes for Azure Firewall terrafrom module

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resource."
  
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  
}

variable "sku_name" {
  description = "SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet."
  
}

variable "sku_tier" {
  description = "SKU tier of the Firewall. Possible values are Premium, Standard and Basic."
  
}

variable "firewall_policy_id" {
  description = "The ID of the Firewall Policy applied to this Firewall."
  
}

variable "dns_servers" {
  description = "A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution."
  
}

variable "dns_proxy_enabled" {
  description = "Whether DNS proxy is enabled. It will forward DNS requests to the DNS servers when set to true. It will be set to true if dns_servers provided with a not empty list."
  
}

variable "private_ip_ranges" {
  description = "A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918."
  
}

variable "threat_intel_mode" {
  description = "The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert and Deny. Defaults to Alert."
  
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."  
}

variable "ip_configuration" {
    type = object({
      name = string
        subnet_id = string
        public_ip_address_id = string
    })
  description = "A list of ip_configuration blocks as defined below."
}

variable "management_ip_configuration" {
    type = object({
      name = string
      subnet_id = string
      public_ip_address_id = string
    })
  description = "A management_ip_configuration block as defined below."
  default = null
}

variable "virtual_hub" {
    type = object({
      virtual_hub_id = string
      public_ip_count = number
    })
  description = "A virtual_hub block as defined below."
  default = null
}

variable "naming_convention_info" {
  description = "A naming_convention_info block as defined below."
  type = object({
    name         = string
    project_code = string
    env          = string
    zone         = string
    agency_code  = string
    tier         = string
  })
  
}


