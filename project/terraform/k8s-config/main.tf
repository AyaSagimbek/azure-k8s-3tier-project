provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "mysql" {
  name      = "mysql"
  chart     = var.mysql_chart_dir   
  namespace = var.namespace

  values = [
    file(var.mysql_values_path)    
  ]
}

resource "helm_release" "api" {
  name      = "api"
  chart     = var.api_chart_dir
  namespace = var.namespace

  values = [
    file(var.api_values_path)
  ]

  depends_on = [helm_release.mysql]
}

resource "helm_release" "web" {
  name      = "web"
  chart     = var.web_chart_dir
  namespace = var.namespace

  values = [
    file(var.web_values_path)
  ]

  depends_on = [helm_release.api]
}
