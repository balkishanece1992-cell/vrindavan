module "azurerm_resource_group" {
  source = "../../Child_module/azurerm_resource_group"
  rg     = var.rg
}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Child_module/azurerm_virtual_network"
  vnet       = var.vnet
}
module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../Child_module/azurerm_subnet"
  subnet     = var.subnet
}
module "azurerm_pip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../child_module/azurerm_pip"
  pip        = var.pip
}
module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_pip, module.azurerm_subnet]
  source     = "../../Child_module/azurerm_virtual_machine"
  VM-c       = var.VM-c
}
module "azurerm_key_vault" {
  source = "../../Child_module/azurerm_key_vault"
  kv     = var.kv
}