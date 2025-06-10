resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-project"
  location            = var.location
  resource_group_name = var.rgName
  dns_prefix          = "dns-k8s-test"
 

  default_node_pool {
    name            = "testnodepool"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
    vnet_subnet_id  = azurerm_subnet.private.id
  }

  service_principal {
    client_id     = var.clientId
    client_secret = var.clientSecret
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    service_cidr      = "10.244.0.0/16"
    dns_service_ip    = "10.244.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  tags = {
    environment = "test"
  }
}