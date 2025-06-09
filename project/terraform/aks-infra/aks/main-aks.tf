provider "azurerm" {
  features {}

  subscription_id = var.subId
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "aks-project"
  location            = "West US"
  resource_group_name = "rg-aks-project"
  dns_prefix          = "dns-k8s-test"
  kubernetes_version  = "1.33.0"

  default_node_pool {
    name            = "testnodepool"
    node_count      = 2
    vm_size         = "Standard_B2pls_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.clientId
    client_secret = var.clientSecret
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "test"
  }
}