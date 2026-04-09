# VNet Peering: Spoke to Hub
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "spoke-to-hub-peering"
  resource_group_name       = module.rg.resource_group_name
  virtual_network_name      = module.vnet.virtual_network_name
  remote_virtual_network_id = "/subscriptions/{subscription_id}/resourceGroups/{hub_rg_name}/providers/Microsoft.Network/virtualNetworks/{hub_vnet_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# VNet Peering: Hub to Spoke (Return Peering)
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "hub-to-spoke-peering"
  resource_group_name       = "{hub_rg_name}"
  virtual_network_name      = "{hub_vnet_name}"
  remote_virtual_network_id = "/subscriptions/{subscription_id}/resourceGroups/${module.rg.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${module.vnet.virtual_network_name}"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}