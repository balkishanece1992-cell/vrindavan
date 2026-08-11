resource "azurerm_key_vault" "kv" {
    for_each = var.kv
    name = each.value.kv_name
    location = each.value.kv_location
    resource_group_name = each.value.resource_group_name
  
  
sku_name = each.value.sku_name
    purge_protection_enabled = each.value.purge_protection_enabled
    soft_delete_retention_days = each.value.soft_delete_retention_days

    rbac_authorization_enabled = each.value.rbac_authorization_enabled
    # value                     = each.value.value
    # password                  = each.value.password
    # admin_username = each.value.admin_username
    tenant_id = each.value.tenant_id

}
resource "azurerm_key_vault_secret" "vm_username" {

  for_each = var.kv

  name         = "vm-admin-username"
  value        = each.value.admin_username
  key_vault_id = azurerm_key_vault.kv[each.key].id
}

resource "azurerm_key_vault_secret" "vm_password" {
 for_each = var.kv

  name         = "vm-admin-password"
  value        = random_password.vm_password[each.key].result
  key_vault_id = azurerm_key_vault.kv[each.key].id
  
}
resource "random_password" "vm_password" {

  for_each = var.kv

  length           = 20
  special          = true
  override_special = "!@#$%^&*"
   }
  